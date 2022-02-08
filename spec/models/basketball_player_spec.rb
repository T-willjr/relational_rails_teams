require 'rails_helper'

RSpec.describe BasketballPlayer do
  describe 'relations' do
    it {should belong_to :basketball_team}
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should allow_value(true).for(:injured) }
    it {should allow_value(false).for(:injured) }
    it {should validate_presence_of :jersey_number }
  end

  it "should display only injured basketball players" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
    team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)
    player = team.basketball_players.create!(name: "Trae Young", injured: true, jersey_number: 11)
    player2 = team.basketball_players.create!(name: "John Collins", injured: true, jersey_number: 20)
    player3 = team2.basketball_players.create!(name: "Odyssey Sims", injured: false, jersey_number: 0)
    player4 = team3.basketball_players.create!(name: "Jordan Usher", injured: false, jersey_number: 4)
    expect(BasketballPlayer.injured?).to eq([player, player2])
    expect(BasketballPlayer.injured?).to_not eq([player3, player4])
  end

  describe "#alphabetical_order" do
    it "orders players alphabetically" do
      team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
      player = team.basketball_players.create!(name: "Trae Young", injured: false, jersey_number: 11)
      player2 = team.basketball_players.create!(name: "John Collins", injured: false, jersey_number: 20)
      player3 = team.basketball_players.create!(name: "Kevin Huerter", injured: false, jersey_number: 3)
      expect(team.basketball_players.alphabetical_order).to eq([player2,player3,player])
    end
  end
end
