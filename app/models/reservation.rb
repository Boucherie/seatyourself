class Reservation < ApplicationRecord
  belongs_to :diner
  belongs_to :restaurant

  validates :name, :date, :time, :open_time, :party_size, presence: true

  validates :capacity, numericality: { only_interger: true, less_than_or_equal_to: 10 }

  validates: :url, uniqueness: true

end
