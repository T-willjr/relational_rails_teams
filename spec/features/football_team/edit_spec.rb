require 'rails_helper'

RSpec.describe "Football Team Edit Page" do
  it "has a form to edit the FBT attributes. Once filled out and submitted, it redirects to show page with updated info" do
    team = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
    visit "/football_teams/#{team.id}/edit"

    fill_in "Name", with: "Paul's Team"
    fill_in "Public?", with: 'true'
    fill_in "Number of Titles", with: "50000"
    click_button "Submit"

    expect(current_path).to eq("/football_teams/#{team.id}")
    expect(page).to have_content("Paul's Team")
    expect(page).to_not have_content("Georgia Bulldogs")
  end
end
