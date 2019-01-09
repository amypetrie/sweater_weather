class User < ApplicationRecord
  has_many :favorites
  validates :email, uniqueness: true
  validates_presence_of :password_digest


  has_secure_password validations: true

  before_create do
    self.api_key = SecureRandom.hex(14)
  end

end
