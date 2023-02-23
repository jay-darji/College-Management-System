class Address < ApplicationRecord
  belongs_to :user, :foreign_key => "userId"

  validates :postalCode, presence: true, length: {is: 6}, numericality: { only_integer: true }
end
