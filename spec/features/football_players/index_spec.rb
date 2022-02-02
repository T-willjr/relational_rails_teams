require 'rails_helper'

RSpec.describe "Football Player Index" do
  it "When I visit the football players index, I see every player including their attributes" do
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
    visit "/football_players"

    expect(page).to have_content(player1.name)
    expect(page).to have_content(player1.jersey_number)
    expect(page).to have_content(player1.eligible)
    expect(page).to have_content(player2.name)
    expect(page).to have_content(player2.jersey_number)
    expect(page).to have_content(player2.eligible)
    expect(page).to have_content(player3.name)
    expect(page).to have_content(player3.jersey_number)
    expect(page).to have_content(player3.eligible)
  end
end
