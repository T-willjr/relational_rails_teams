require 'rails_helper'

RSpec.describe "Basketball Player Edit Page" do
  it "can update a basketball players information" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    player = team.basketball_players.create!(name: "Trae Young", injured: true, jersey_number: 11)
    visit "/basketball_players/#{player.id}"
    expect(page).to have_content(player.name)
    click_link "Update Player"
    expect(current_path).to eq("/basketball_players/#{player.id}/edit")
    fill_in 'Name', with: "New Player Name"
    fill_in 'Injured', with: false
    fill_in 'Jersey Number', with: 3
    click_button "Submit"
    expect(current_path).to eq("/basketball_players/#{player.id}")
    expect(page).to have_content("New Player Name")
    expect(page).to_not have_content("Trae Young")
  end
end
