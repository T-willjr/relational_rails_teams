require 'rails_helper'

RSpec.describe BasketballTeam do
  describe 'relations' do
    it { should have_many :basketball_players }
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should allow_value(true).for(:winning_record) }
    it {should allow_value(false).for(:winning_record) }
    it {should allow_value(nil).for(:winning_record) }
    it {should validate_presence_of :titles }
  end

  describe "#order_by_most_recently_created" do
    it "should order basketball teams by most recently created" do
      team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
      team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
      team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)
      expect(BasketballTeam.order_by_most_recently_created).to eq([team,team2,team3])
    end
  end
end
