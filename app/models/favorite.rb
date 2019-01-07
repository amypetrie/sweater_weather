class Favorite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates_presence_of :location
end
