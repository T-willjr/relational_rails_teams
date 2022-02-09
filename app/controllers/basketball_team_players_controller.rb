class BasketballTeamPlayersController < ApplicationController
  def index
    @team = BasketballTeam.find(params[:id])
    if params[:sort]
      @players = @team.basketball_players.alphabetical_order
    elsif params[:jersey_number]
      @players = @team.basketball_players.jersey_number_search(params[:jersey_number])
    else
      @players = @team.basketball_players
    end
  end

  def new
    @team = BasketballTeam.find(params[:id])
  end

  def create
    team = BasketballTeam.find(params[:id])
    @player = team.basketball_players.create(player_params)
    redirect_to "/basketball_teams/#{team.id}/players"
  end


  private

  def player_params
    params.permit(:name, :injured, :jersey_number)
  end
end
