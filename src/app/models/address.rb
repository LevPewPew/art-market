class Address < ApplicationRecord
  belongs_to :user_detail
  enum state: { Select: 0, ACT: 1, NSW: 2, NT: 3, QLD: 4, SA: 5, TAS: 6, VIC: 7, WA: 8 }

  validates :postcode, length: { is: 4 }, format: { with: /[0-9]+/, message: "Only allows values between 0000 and 9999." }, allow_nil: true
end
