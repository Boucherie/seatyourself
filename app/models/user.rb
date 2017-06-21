class User < ApplicationRecord
  has_secure_password

<<<<<<< HEAD


=======
  has_many :restaurants

  validates :email, presence: true, uniqueness: true

  ALLOWED_ROLES = ["diner", "owner"]
>>>>>>> 4cf41318dc6d194f3f185594e7cb16ae5a97d1e8
end
