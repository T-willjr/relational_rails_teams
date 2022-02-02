require 'rails_helper'

RSpec.describe "BasketballTeam Information" do
  it "displays a basetball team's information" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
    team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)
    visit "/basketball_teams/#{team.id}"
    expect(page).to have_content(team.name)
    expect(page).to have_content(team.winning_record)
    expect(page).to have_content(team.titles)
  end
end
