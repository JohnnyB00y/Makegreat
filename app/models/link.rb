class Link < ApplicationRecord
  acts_as_list

  belongs_to :magazine
end
