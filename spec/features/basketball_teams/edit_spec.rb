require 'rails_helper'

RSpec.describe "Basketball Team Edit Page" do
  it "can update a basketball team" do
    @team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    visit "/basketball_teams/#{@team.id}"
    expect(page).to have_content(@team.name)
    click_link "Update Team"
    expect(current_path).to eq("/basketball_teams/#{@team.id}/edit")
    fill_in 'Name', with: 'New Team Name'
    fill_in 'Winning Record', with: false
    fill_in 'Titles', with: 17
    click_button "Submit"
    expect(current_path).to eq("/basketball_teams/#{@team.id}")
    expect(page).to have_content("New Team Name")
    expect(page).to_not have_content("Atlanta Hawks")
  end
end
