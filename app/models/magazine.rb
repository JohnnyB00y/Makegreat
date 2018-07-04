class Magazine < ApplicationRecord
  has_many :links, ->{ order(position: :asc) }, dependent: :destroy
end
