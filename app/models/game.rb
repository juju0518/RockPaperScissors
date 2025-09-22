class Game < ApplicationRecord
  belongs_to :user
  validates :user_move, :computer_move, :result, presence: true
end
