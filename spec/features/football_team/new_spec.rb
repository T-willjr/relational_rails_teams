require 'rails_helper'

RSpec.describe "Football Team #new Page" do
  it "has a form to create a new football team, and once its filled out and submitted, it redirects to #index where new team is seen" do
    expect(FootballTeam.count).to eq(0)
    visit "/football_teams/new"

    fill_in 'Name', with: "TJ's Team"
    fill_in 'Public?', with: "true"
    fill_in 'Number of Titles', with: "200"
    click_button "Create Team"

    expect(current_path).to eq('/football_teams')
    expect(FootballTeam.count).to eq(1)
    expect(page).to have_content("TJ's Team")
  end
end
