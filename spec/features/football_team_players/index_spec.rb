require 'rails_helper'

RSpec.describe "Football Team Players (parent child) Index" do
  it "When I visit the football_team players index, I see all players on the team and their attributes" do
    team = FootballTeam.create!(name: "Georgia Bulldogs", public: false, titles: 2)
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
    visit "/football_teams/#{team.id}/players"

    expect(page).to have_content(team.name)
    expect(page).to have_content(player1.name)
    expect(page).to have_content("Jersey Number: #{player1.jersey_number}")
    expect(page).to have_content("Eligible?: #{player1.eligible}")
    expect(page).to have_content(player2.name)
    expect(page).to have_content("Jersey Number: #{player2.jersey_number}")
    expect(page).to have_content("Eligible?: #{player2.eligible}")
    expect(page).to_not have_content(player3.name)
  end

  it "has a link to add new players" do
    team = FootballTeam.create!(name: "Georgia Bulldogs", public: false, titles: 2)
    visit "/football_teams/#{team.id}/players"

    click_link("Create Player")
    expect(current_path).to eq("/football_teams/#{team.id}/players/new")
  end

  it "has a link to sort players alphabetically.  Link refreshes the page and sorts players alphabetically" do
    team = FootballTeam.create!(name: "Georgia Bulldogs", public: false, titles: 2)
    player1 = team.football_players.create!(name: "Matthew Stafford",
                                                    jersey_number: 69,
                                                    eligible: true)
    player2 = team.football_players.create!(name: "Paul Leonard",
                                                    jersey_number: 9,
                                                    eligible: true)
    player3 = team.football_players.create!(name: "Calvin Johnson",
                                                    jersey_number: 81,
                                                    eligible: false)
    visit "/football_teams/#{team.id}/players"
    
    expect(player2.name).to appear_before(player3.name)

    click_link "Sort Players Alphabetically"

    expect(current_path).to eq("/football_teams/#{team.id}/players")
    expect(player3.name).to appear_before(player1.name)
    expect(player1.name).to appear_before(player2.name)
    expect(player3.name).to appear_before(player2.name)
  end
end
