class BasketballPlayer < ApplicationRecord
  belongs_to :basketball_team

  validates_presence_of :name
  validates :injured,
            inclusion: { in: [true, false] }
  validates_presence_of :jersey_number

  def self.injured?
    where(injured: :true)
  end

  def self.alphabetical_order
    order(:name)
  end

  def self.jersey_number_search(number)
    where("jersey_number > ?", number)
  end
end
