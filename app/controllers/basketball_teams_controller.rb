class BasketballTeamsController < ApplicationController
  def index
    @teams = BasketballTeam.all
  end

  def show
    @team = BasketballTeam.find(params[:id])
  end

  def players
    show
    @players = @team.basketball_players
  end
end
