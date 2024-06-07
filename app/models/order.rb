class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :pay_method, presence: true
end
