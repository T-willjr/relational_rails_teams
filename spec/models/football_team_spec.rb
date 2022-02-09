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

  describe 'instance methods' do
    it "can return a count of the number of players on a team" do
      team = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
      team2 = FootballTeam.create!(name: "Georgia Tech", public: true, titles: 2)
      player1 = team.football_players.create!(name: "Paul Leonard",
                                                      jersey_number: 69,
                                                      eligible: true)
      player2 = team.football_players.create!(name: "Matthew Stafford",
                                                      jersey_number: 9,
                                                      eligible: true)
      player3 = team2.football_players.create!(name: "Calvin Johnson",
                                                      jersey_number: 81,
                                                      eligible: false)

      expect(team.player_count).to eq(2)
      expect(team2.player_count).to eq(1)
    end

    it "can order its own players alphabetically" do
      team = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
      player1 = team.football_players.create!(name: "Matthew Stafford",
                                                      jersey_number: 69,
                                                      eligible: true)
      player2 = team.football_players.create!(name: "Paul Leonard",
                                                      jersey_number: 9,
                                                      eligible: true)
      player3 = team.football_players.create!(name: "Calvin Johnson",
                                                      jersey_number: 81,
                                                      eligible: false)

      expect(team.alpha_order).to eq([player3, player1, player2])
    end

    it "it can show only players with jery number's higher than a given threshold" do
      team = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
      player1 = team.football_players.create!(name: "Matthew Stafford",
                                                      jersey_number: 69,
                                                      eligible: true)
      player2 = team.football_players.create!(name: "Paul Leonard",
                                                      jersey_number: 9,
                                                      eligible: true)
      player3 = team.football_players.create!(name: "Calvin Johnson",
                                                      jersey_number: 81,
                                                      eligible: false)
      expect(team.jersey_numbers_higher_than(10)).to eq([player1, player3])
    end
  end
end
