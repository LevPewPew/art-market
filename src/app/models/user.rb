class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail
  has_many :listings, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :comments, dependent: :destroy
end
