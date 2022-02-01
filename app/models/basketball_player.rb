class BasketballPlayer < ApplicationRecord
  belongs_to :basketball_team

  validates_presence_of :name
  validates_presence_of :injured
  validates_presence_of :jersey_number
end
