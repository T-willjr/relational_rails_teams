class BasketballPlayer < ApplicationRecord
  belongs_to :basketball_team

  validates_presence_of :name
  validates :injured,
            inclusion: { in: [true, false] }
  validates_presence_of :jersey_number
end
