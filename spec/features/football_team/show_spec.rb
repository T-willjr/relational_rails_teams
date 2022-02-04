require 'rails_helper'

RSpec.describe "Football Team Show" do
  it "when I visit a football team's show page, I see that football team's attributes listed" do
    team1 = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
    team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
    visit "/football_teams/#{team1.id}"

    expect(page).to have_content(team1.name)
    expect(page).to have_content(team1.public)
    expect(page).to have_content(team1.titles)
    expect(page).to_not have_content(team2.name)
  end

  it "has a count of the number of players on the team" do
    team = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
    player1 = team.football_players.create!(name: "Paul Leonard",
                                                    jersey_number: 69,
                                                    eligible: true)
    player2 = team.football_players.create!(name: "Matthew Stafford",
                                                    jersey_number: 9,
                                                    eligible: true)
    visit "/football_teams/#{team.id}"

    expect(page).to have_content("Number of players: 2")
  end
end
