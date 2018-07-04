class LinksController < ApplicationController
  before_action :set_magazine
  before_action :set_link, except: [:create, :sort]
  skip_before_action :verify_authenticity_token, only: [:sort]

  def create
    @link = @magazine.links.create(link_params)
    redirect_to @magazine
  end

  def sort
      params[:link].each_with_index do |id, index|
          Link.where(id: id).update_all(position: index + 1)
      end
  end


  def destroy
    if @link.destroy
      flash[:success] = "Link Deleted"
    else
      flash[:error] = "Wasn't deleted"
    end
    redirect_to @magazine
  end


  private

  def set_magazine
    @magazine = Magazine.find(params[:magazine_id])
  end

  def set_link
    @link = @magazine.links.find(params[:id])
  end

  def link_params
    params[:link].permit(:commentary, :url)
  end
end
