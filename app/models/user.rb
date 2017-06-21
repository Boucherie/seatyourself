class User < ApplicationRecord
  has_secure_password


  has_many :restaurants

  validates :email, presence: true, uniqueness: true

  validates_length_of :password, :in => 6..20

  ALLOWED_ROLES = ["diner", "owner"]

end
