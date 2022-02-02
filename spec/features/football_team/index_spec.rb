require 'rails_helper'

RSpec.describe "Football Teams Index" do
  it "When I visit the football team index, I see the name of every team" do
    team1 = FootballTeam.create!(name: "Georgia Bulldogs", public: true, titles: 2)
    team2 = FootballTeam.create!(name: "Georgia Tech", public: true, titles: 1)
    team3 = FootballTeam.create!(name: "Georgia Southern", public: true, titles: 5)
    visit "/football_teams"

    expect(page).to have_content(team1.name)
    expect(page).to have_content(team2.name)
    expect(page).to have_content(team3.name)
  end
end
