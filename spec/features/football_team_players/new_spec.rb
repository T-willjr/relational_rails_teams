require 'rails_helper'

RSpec.describe "Football Team Players New Page" do
  it "has a form that once filled out and submitted redirects to the index with new player on page" do
    team = FootballTeam.create!(name: "Georgia Bulldogs", public: false, titles: 2)
    visit "/football_teams/#{team.id}/players/new"

    fill_in 'Name', with: "Paul's Dad"
    fill_in 'Eligible?', with: "false"
    fill_in 'Jersey Number', with: "00"
    click_button "Create Player"

    expect(current_path).to eq("/football_teams/#{team.id}/players")
    expect(page).to have_content("Paul's Dad")
  end
end
