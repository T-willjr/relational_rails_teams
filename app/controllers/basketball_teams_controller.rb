class BasketballTeamsController < ApplicationController
  def index
    @team = BasketballTeam.all
  end
end
