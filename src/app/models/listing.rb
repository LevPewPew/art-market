class Listing < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_many :listings_styles, inverse_of: :listing
  has_many :styles, through: :listings_styles
  accepts_nested_attributes_for :listings_styles
  has_many :comments
end
