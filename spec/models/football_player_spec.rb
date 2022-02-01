require 'rails_helper'

RSpec.describe FootballPlayer do
  describe 'relations' do
    it {should belong_to :football_team}
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should validate_presence_of :jersey_number }
    it {should validate_presence_of :eligible }
  end
end
