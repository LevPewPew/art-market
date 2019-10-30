class Address < ApplicationRecord
  belongs_to :user_detail
  enum state: { ACT: 0, NSW: 1, NT: 2, QLD: 3, SA: 4, TAS: 5, VIC: 6, WA: 7 }
end
