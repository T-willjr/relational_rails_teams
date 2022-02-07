require 'rails_helper'

RSpec.describe "New Basketball Team Form" do

  it "creates new basketball team" do
    visit "/basketball_teams/new"
    fill_in 'Name', with: "Hillgrove Hawks"
    fill_in 'Winning Record', with: "true"
    fill_in 'Titles', with: "1"
    click_button "Submit"
    expect(current_path).to eq('/basketball_teams')
    expect(page).to have_content("Hillgrove Hawks")
  end
end
