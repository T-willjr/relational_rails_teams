require 'rails_helper'

RSpec.describe "BasketballTeams" do
  it "displays names of Basketball Teams" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
    team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)
    visit '/basketballteams'
    expect(page).to have_content(team.name)
    expect(page).to have_content(team2.name)
    expect(page).to have_content(team3.name)
  end
end
