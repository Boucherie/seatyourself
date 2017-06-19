class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :owner

  validates :name, :address, :capacity, :open_time, :close_time, presence: true

  validates :capacity, numericality: { only_interger: true }

  validates :url, uniqueness: true
end
