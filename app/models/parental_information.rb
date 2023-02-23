class ParentalInformation < ApplicationRecord

  #-----validation-------
  validates :fatherMobileNo, presence: true, length: {is: 10}, numericality: { only_integer: true }
  validates :motherMobileNo, length: {is: 10}, numericality: { only_integer: true }, unless: Proc.new{|parentInfo| parentInfo.motherMobileNo.nil? }

  #---association-----
  belongs_to :user, :foreign_key => "userId"
end
