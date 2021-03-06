require 'rails_helper'

RSpec.describe "BasketballTeams" do
  it "displays names of Basketball Teams" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
    team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)

    visit '/basketball_teams'

    expect(page).to have_content(team.name)
    expect(page).to have_content(team2.name)
    expect(page).to have_content(team3.name)
  end

  it "displays dates when Basketball Teams record was created" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
    team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)

    visit '/basketball_teams'

    expect(page).to have_content(team.created_at)
    expect(page).to have_content(team2.created_at)
    expect(page).to have_content(team3.created_at)
  end

  it "has a link to all basketball players" do
    visit '/basketball_teams'
    click_link "Basketball Players"
    expect(current_path).to eq("/basketball_players")
  end

  it "has a link to create a new basketball team" do
    visit '/basketball_teams'
    click_link "New Basketball Team"
    expect(current_path).to eq("/basketball_teams/new")
  end

  it "has a link to update a basketball teams information" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    visit "/basketball_teams"
    click_link("Update Team", match: :first)
    expect(current_path).to eq("/basketball_teams/#{team.id}/edit")
  end

  it "has a link to delete a basketball team" do
    team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
    team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
    team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)

    visit "/basketball_teams"
    expect(page).to have_content(team3.name)
    click_link("Delete Team", match: :first)
    expect(current_path).to eq("/basketball_teams")
    expect(page).to_not have_content(team3.name)
  end
end
