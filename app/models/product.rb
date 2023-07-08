class Product < ApplicationRecord
  belongs_to :users
  has_one_attached :image
end
