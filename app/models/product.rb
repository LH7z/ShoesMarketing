class Product < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :name_or_description, against: %i[name description], using: { tsearch: { prefix: true } }

  belongs_to :user
  has_many_attached :photos
  has_many :line_items, dependent: :destroy
  validates :photos, presence: true
  validates :categories, inclusion: { in: ["T-shirt" ,"Jeans" ,"Jacket" ,"Other"], message: "%{value} is not a valid categories" }, presence: true
end
