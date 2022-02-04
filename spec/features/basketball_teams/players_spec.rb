require 'rails_helper'

RSpec.describe "Basketball Teams Players" do
  it "should display players information associated to its team id " do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
    team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)
    player = team.basketball_players.create!(name: "Trae Young", injured: true, jersey_number: 11)
    player2 = team.basketball_players.create!(name: "John Collins", injured: false, jersey_number: 20)
    player3 = team2.basketball_players.create!(name: "Odyssey Sims", injured: false, jersey_number: 0)
    player4 = team3.basketball_players.create!(name: "Jordan Usher", injured: false, jersey_number: 4)
    visit "/basketball_teams/#{team.id}/basketball_players"
    expect(page).to have_content(player.name)
    expect(page).to have_content(player.injured)
    expect(page).to have_content(player.jersey_number)
    expect(page).to have_content(player2.name)
    expect(page).to have_content(player2.injured)
    expect(page).to have_content(player2.jersey_number)
    expect(page).to_not have_content(player3.name)
    expect(page).to_not have_content(player4.name)
  end

  it "has a link to all basketball players" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    visit "/basketball_teams/#{team.id}/basketball_players"
    click_link "Basketball Players"
    expect(current_path).to eq("/basketball_players")
  end
end
