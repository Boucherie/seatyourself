class Reservation < ApplicationRecord
  belongs_to :diner
  belongs_to :restaurant

  validates :date, :time, :party_size, presence: true

  validates :party_size, numericality: { only_interger: true, less_than_or_equal_to: 10 }

  

end
