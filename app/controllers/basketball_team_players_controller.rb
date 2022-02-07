class BasketballTeamPlayersController < ApplicationController
  def index
    @team = BasketballTeam.find(params[:id])
    @players = @team.basketball_players
  end

  def new
  end 
end
