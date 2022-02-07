class BasketballTeam < ApplicationRecord
  has_many :basketball_players

  validates_presence_of :name
  validates :winning_record,
            inclusion: { in: [true, false, nil] }
  validates_presence_of :titles

  def self.order_by_most_recently_created
    order(created_at: :desc)
  end

  def number_of_players
    self.basketball_players.count
  end
end
