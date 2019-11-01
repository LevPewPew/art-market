class Purchase < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates_uniqueness_of :listing_id
end
