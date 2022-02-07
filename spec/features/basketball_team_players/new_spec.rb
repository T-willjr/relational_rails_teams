require 'rails_helper'

RSpec.describe "New Basketball Player Page" do
  it "creates new basketball player" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    player = team.basketball_players.create!(name: "Trae Young", injured: true, jersey_number: 11)
    visit "/basketball_teams/#{team.id}/players/new"
    fill_in 'Name', with: "New Player"
    fill_in 'Injured', with: false
    fill_in 'Jersey Number', with: 2
    click_button "Submit"
    expect(current_path).to eq("/basketball_teams/#{team.id}/players")
    expect(page).to have_content("New Player")
    expect(page).to have_content("Trae Young")
  end
end
