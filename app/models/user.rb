class User < ApplicationRecord
  has_many :games, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
