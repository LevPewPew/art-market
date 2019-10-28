class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_detail
  accepts_nested_attributes_for :user_detail
  has_many :listings
  has_many :purchases
  has_many :comments
end
