class BasketballTeam < ApplicationRecord
  has_many :basketball_players

  validates_presence_of :name
  validates :winning_record,
            inclusion: { in: [true, false, nil] }
  validates_presence_of :titles
end
