class User < ApplicationRecord
  has_many :favorites
  validates :email, uniqueness: true

  has_secure_password validations: false

  before_create do
    self.api_key = SecureRandom.hex(14)
  end

end
