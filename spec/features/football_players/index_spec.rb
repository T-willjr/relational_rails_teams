require 'rails_helper'

RSpec.describe "Football Player Index" do
  it "When I visit the football players index, I see every player that eligible == true for,  including their attributes" do
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
                                                    eligible: true)
    player4 = team.football_players.create!(name: "I have a false boolean value",
                                                    jersey_number: 99,
                                                    eligible: false)
    visit "/football_players"

    expect(page).to have_content("Name: #{player1.name}")
    expect(page).to have_content("Jersey Number: #{player1.jersey_number}")
    expect(page).to have_content("Eligible?: #{player1.eligible}")
    expect(page).to have_content("Name: #{player2.name}")
    expect(page).to have_content("Jersey Number: #{player2.jersey_number}")
    expect(page).to have_content("Eligible?: #{player2.eligible}")
    expect(page).to have_content("Name: #{player3.name}")
    expect(page).to have_content("Jersey Number: #{player3.jersey_number}")
    expect(page).to have_content("Eligible?: #{player3.eligible}")
    expect(page).to_not have_content(player4.name)
  end
end
