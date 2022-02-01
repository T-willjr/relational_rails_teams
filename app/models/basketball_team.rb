class BasketballTeam < ApplicationRecord
  has_many :basketball_players

  validates_presence_of :name
  validates_presence_of :winning_record
  validates_presence_of :titles
end
