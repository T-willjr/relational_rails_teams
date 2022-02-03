require 'rails_helper'

RSpec.describe FootballTeam do
  describe 'relations' do
    it { should have_many :football_players }
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should allow_value(true).for(:public) }
    it {should allow_value(false).for(:public) }
    it {should validate_presence_of :titles }
  end

  describe 'class methods' do
    it "can order all instances of class by most recently created" do
      team = FootballTeam.create!(name: "Georgia Bulldogs", public: false, titles: 2)
      team2 = FootballTeam.create!(name: "Georgia Tech", public: true, titles: 2)

      expect(FootballTeam.first).to eq(team)
      expect(FootballTeam.last).to eq(team2)
      expect(FootballTeam.order_by_most_recently_created).to eq([team2, team])
    end
  end
end
