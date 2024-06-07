class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          has_many :products, dependent: :destroy
          has_many :carts
          has_many :orders
          has_one_attached :photo
          validates :nickname, presence: true
          enum :role, { admin: 0, costumer: 1 }, default: 1
end
