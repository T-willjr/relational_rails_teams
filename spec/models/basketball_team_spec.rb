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
end
