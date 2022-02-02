class BasketballTeamsController < ApplicationController
  def index
    @teams = BasketballTeam.all
  end

  def show
    @team = BasketballTeam.find(params[:id])
  end
end
