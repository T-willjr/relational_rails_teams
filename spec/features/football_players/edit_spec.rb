require 'rails_helper'

RSpec.describe "Football Player Edit Page" do
  it "has a form to edit the football player. when filled out and submitted, it redirects to show page with updated info" do
    team = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
    player1 = team.football_players.create!(name: "Paul Leonard",
                                            jersey_number: 69,
                                            eligible: true)
    visit "/football_players/#{player1.id}/edit"

    fill_in 'Name', with: "Paul's Dad"
    fill_in 'Eligible?', with: "false"
    fill_in 'Jersey Number', with: "00"
    click_button "Update Player"

    expect(current_path).to eq("/football_players/#{player1.id}")
    expect(page).to have_content("Paul's Dad")
    expect(page).to_not have_content("Paul Leonard")
  end
end
