class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date, :time, :party_size, presence: true

  validates :party_size, numericality: { only_interger: true, :greater_than => 0, less_than_or_equal_to: 10 }



  #how do i validate something in another model



end
