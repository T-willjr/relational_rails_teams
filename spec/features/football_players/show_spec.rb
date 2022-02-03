require 'rails_helper'

RSpec.describe "Football Player Show" do
  it "When I visit a football player show page, I see the football player and its attributes" do
    team = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
    player1 = team.football_players.create!(name: "Paul Leonard",
                                            jersey_number: 69,
                                            eligible: true)
    player2 = team.football_players.create!(name: "Matthew Stafford",
                                            jersey_number: 9,
                                            eligible: true)
    visit "/football_players/#{player1.id}"

    expect(page).to have_content(player1.name)
    expect(page).to have_content("Jersey Number: #{player1.jersey_number}")
    expect(page).to have_content("Eligible?: #{player1.eligible}")
    expect(page).to_not have_content(player2.name)
  end
end
