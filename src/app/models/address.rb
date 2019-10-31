class Address < ApplicationRecord
  belongs_to :user_detail
  enum state: { Select: 0, ACT: 1, NSW: 2, NT: 3, QLD: 4, SA: 5, TAS: 6, VIC: 7, WA: 8 }

  validates :postcode, numericality: { only_integer: true, greater_than_or_equal_to: 1000, less_than_or_equal_to: 7999 }
end
