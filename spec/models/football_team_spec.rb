require 'rails_helper'

RSpec.describe FootballTeam do
  describe 'relations' do
    it { should have_many :football_players }
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should validate_presence_of :public }
    it {should validate_presence_of :titles }
  end
end
