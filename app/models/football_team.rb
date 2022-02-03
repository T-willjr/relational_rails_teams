class FootballTeam < ApplicationRecord
  has_many :football_players

  validates_presence_of :name
  validates :public,
            inclusion: { in: [true, false] }
  validates_presence_of :titles


  def self.order_by_most_recently_created
    order(created_at: :desc)
  end
end
