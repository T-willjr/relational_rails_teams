require 'rails_helper'

RSpec.describe BasketballPlayer do
  describe 'relations' do
    it {should belong_to :basketball_team}
  end

  describe 'validations' do
    it {should validate_presence_of :name }
    it {should allow_value(true).for(:injured) }
    it {should allow_value(false).for(:injured) }
    it {should validate_presence_of :jersey_number }
  end
end
