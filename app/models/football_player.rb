class FootballPlayer < ApplicationRecord
  belongs_to :football_team

  validates_presence_of :name
  validates_presence_of :jersey_number
  validates :eligible,
            inclusion: { in: [true, false] }

  def self.eligibility_filter
    where(eligible: true)
  end
end
