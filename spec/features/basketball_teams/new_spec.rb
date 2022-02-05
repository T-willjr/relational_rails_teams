require 'rails_helper'

RSpec.describe "New Basketball Team" do
  it "can submit a new basketball team" do
    visit '/basketball_teams'
    click_button "Submit"
    expect(current_path).to eq("/basketball_teams")
  end
end
