require 'rails_helper'

RSpec.describe FootballTeam do
  describe 'relations' do
    it { should have_many :football_players }
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should allow_value(true).for(:public) }
    it {should allow_value(false).for(:public) }
    it {should validate_presence_of :titles }
  end
end
