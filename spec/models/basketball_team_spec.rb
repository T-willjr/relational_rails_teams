require 'rails_helper'

RSpec.describe BasketballTeam do
  describe 'relations' do
    it { should have_many :basketball_players }
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should allow_value(true).for(:winning_record) }
    it {should allow_value(false).for(:winning_record) }
    it {should allow_value(nil).for(:winning_record) }
    it {should validate_presence_of :titles }
  end

  describe "#order_by_most_recently_created" do
    it "should order basketball teams by most recently created" do
      team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
      team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
      team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)
      expect(BasketballTeam.order_by_most_recently_created).to eq([team3,team2,team])
      expect(BasketballTeam.order_by_most_recently_created).to_not eq([team,team2,team3])
    end
  end

  describe "#number_of_players" do
    it "should count the numbers of players on a team" do
      team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
      team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
      team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)
      team4 = BasketballTeam.create!(name: "Georgia Tech", winning_record: false, titles: 0)
      player = team.basketball_players.create!(name: "Trae Young", injured: true, jersey_number: 11)
      player2 = team.basketball_players.create!(name: "John Collins", injured: false, jersey_number: 20)
      player3 = team2.basketball_players.create!(name: "Odyssey Sims", injured: false, jersey_number: 0)
      player4 = team3.basketball_players.create!(name: "Jordan Usher", injured: false, jersey_number: 4)
      expect(team.number_of_players).to eq(2)
      expect(team2.number_of_players).to eq(1)
      expect(team3.number_of_players).to eq(1)
      expect(team4.number_of_players).to eq(0)
    end
  end
end
