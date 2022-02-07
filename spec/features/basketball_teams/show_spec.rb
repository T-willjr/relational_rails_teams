require 'rails_helper'

RSpec.describe "BasketballTeam Information" do

  before(:each) do
    @team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    @team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
    @team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)
    @team4 = BasketballTeam.create!(name: "Georgia Tech", winning_record: false, titles: 0)
    @player = @team.basketball_players.create!(name: "Trae Young", injured: true, jersey_number: 11)
    @player2 = @team.basketball_players.create!(name: "John Collins", injured: false, jersey_number: 20)
    @player3 = @team2.basketball_players.create!(name: "Odyssey Sims", injured: false, jersey_number: 0)
    @player4 = @team3.basketball_players.create!(name: "Jordan Usher", injured: false, jersey_number: 4)
  end

  it "displays a basetball @team's information" do
    visit "/basketball_teams/#{@team.id}"
    expect(page).to have_content(@team.name)
    expect(page).to have_content(@team.winning_record)
    expect(page).to have_content(@team.titles)
  end

  it "displays number of players on a @team" do
    visit "/basketball_teams/#{@team.id}"
    expect(page).to have_content("Number of Players: #{@team.number_of_players}")
    visit "/basketball_teams/#{@team2.id}"
    expect(page).to have_content("Number of Players: #{@team2.number_of_players}")
    visit "/basketball_teams/#{@team4.id}"
    expect(page).to have_content("Number of Players: #{@team4.number_of_players}")
  end

  it "has a link to all basketball players" do
    visit "/basketball_teams/#{@team.id}"
    click_link "Basketball Players"
    expect(current_path).to eq("/basketball_players")
    visit "/basketball_teams/#{@team2.id}"
    click_link "Basketball Players"
    expect(current_path).to eq("/basketball_players")
    visit "/basketball_teams/#{@team4.id}"
    click_link "Basketball Players"
    expect(current_path).to eq("/basketball_players")
  end

  it "has a link to basketball teams players index" do
    visit "/basketball_teams/#{@team.id}"
    click_link "#{@team.name} Players"
    expect(current_path).to eq("/basketball_teams/#{@team.id}/players")
    visit "/basketball_teams/#{@team2.id}"
    click_link "#{@team2.name} Players"
    expect(current_path).to eq("/basketball_teams/#{@team2.id}/players")
  end

  it "has a link to update a basketball teams information" do
    visit "/basketball_teams/#{@team.id}"
    click_link "Update Team"
    expect(current_path).to eq("/basketball_teams/#{@team.id}/edit")
    visit "/basketball_teams/#{@team2.id}"
    click_link "Update Team"
    expect(current_path).to eq("/basketball_teams/#{@team2.id}/edit")
  end
end
