class Style < ApplicationRecord
  has_many :listings_styles, inverse_of: :style
  has_many :listings, through: :listings_styles
end
