class Comment < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :body, presence: true
  validates_with PretentiousnessValidator
end
