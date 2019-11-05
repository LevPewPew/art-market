class Listing < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_many :listings_styles, inverse_of: :listing, dependent: :destroy
  has_many :styles, through: :listings_styles
  accepts_nested_attributes_for :listings_styles
  has_many :comments, dependent: :destroy
  has_one_attached :picture, dependent: :destroy
  
  validates :title, presence: true
  validates :artist, presence: true
  validates :price, numericality: true
  validates :description, presence: true
  # no attached/presence validator currently exists for active storage.
  # TODO write/paste a custom validator
end
