require 'rails_helper'

RSpec.describe FootballPlayer do
  describe 'relations' do
    it {should belong_to :football_team}
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should validate_presence_of :jersey_number }
    it {should allow_value(true).for(:eligible) }
    it {should allow_value(false).for(:eligible) }
  end

  describe 'class methods' do
    describe 'eligiblity_filter' do
      it "returns only players who have a true status for :eligible" do
        team = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
        player1 = team.football_players.create!(name: "Paul Leonard",
                                                        jersey_number: 69,
                                                        eligible: true)
        player2 = team.football_players.create!(name: "Matthew Stafford",
                                                        jersey_number: 9,
                                                        eligible: true)
        player3 = team.football_players.create!(name: "Calvin Johnson",
                                                        jersey_number: 81,
                                                        eligible: false)

        expect(FootballPlayer.all.count).to eq(3)
        expect(FootballPlayer.eligiblity_filter).to eq([player1, player2])
        expect(FootballPlayer.eligiblity_filter.count).to eq(3)                                      
      end
    end
  end
end
