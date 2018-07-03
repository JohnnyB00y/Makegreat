class LinksController < ApplicationController
  before_action :set_magazine

  def create
    @link = @magazine.links.create(link_params)

    redirect_to @magazine
  end

  def destroy
    @link = @magazine.links.find(params[:id])
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

  def link_params
    params[:link].permit(:commentary, :url)
  end
end
