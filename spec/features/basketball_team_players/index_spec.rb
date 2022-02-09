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
    visit "/basketball_teams/#{team.id}/players"
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
    visit "/basketball_teams/#{team.id}/players"
    click_link "Basketball Players"
    expect(current_path).to eq("/basketball_players")
  end

  it "has a link to create a new basketball player" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    visit "/basketball_teams/#{team.id}/players"
    click_link "Create Player"
    expect(current_path).to eq("/basketball_teams/#{team.id}/players/new")
  end

  it "has a link to display players alphabetically" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    visit "/basketball_teams/#{team.id}/players"
    click_link "Sort Players Alphabetically"
    expect(current_path).to eq("/basketball_teams/#{team.id}/players")
  end

  it "displays players sorted alphabetically" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    player = team.basketball_players.create!(name: "Trae Young", injured: false, jersey_number: 11)
    player2 = team.basketball_players.create!(name: "John Collins", injured: false, jersey_number: 20)
    player3 = team.basketball_players.create!(name: "Kevin Huerter", injured: false, jersey_number: 3)
    visit "/basketball_teams/#{team.id}/players"
    click_link "Sort Players Alphabetically"
    expect(player2.name).to appear_before(player3.name)
    expect(player2.name).to appear_before(player.name)
    expect(player3.name).to appear_before(player.name)
  end


  it "has a form to enter basketball jersey number" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    player = team.basketball_players.create!(name: "Trae Young", injured: true, jersey_number: 11)
    player2 = team.basketball_players.create!(name: "John Collins", injured: false, jersey_number: 20)
    player3 = team.basketball_players.create!(name: "Kevin Huerter", injured: false, jersey_number: 3)
    visit "/basketball_teams/#{team.id}/players"
    fill_in :jersey_number, with: '10'
    click_button "Submit"
    expect(current_path).to eq("/basketball_teams/#{team.id}/players")
    expect(page).to have_content(player.name)
    expect(page).to have_content(player2.name)
    expect(page).to_not have_content(player3.name)
  end
end
