class User < ApplicationRecord
  has_secure_password

  has_many :restaurants

  validates :email, presence: true, uniqueness: true

  ALLOWED_ROLES = ["diner", "owner"]
end
