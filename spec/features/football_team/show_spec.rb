require 'rails_helper'

RSpec.describe "Football Team Show" do
  it "when I visit a football team's show page, I see that football team's attributes listed" do
    team1 = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    visit "/football_teams/#{team1.id}"

    expect(page).to have_content(team1.name)
    expect(page).to have_content(team1.public)
    expect(page).to have_content(team1.titles)
    expect(page).to_not have_content(team.name)
  end
end
