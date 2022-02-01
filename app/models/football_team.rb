class FootballTeam < ApplicationRecord
  has_many :football_players

  validates_presence_of :name
  validates_presence_of :public
  validates_presence_of :titles
end
