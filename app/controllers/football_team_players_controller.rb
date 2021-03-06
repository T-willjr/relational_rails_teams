class FootballTeamPlayersController < ApplicationController

  def index
    @team = FootballTeam.find(params[:id])
    if params[:sort]
      @players = @team.alpha_order
    elsif params[:jersey_number]
      @players = @team.jersey_numbers_higher_than(params[:jersey_number])
    else
      @players = FootballPlayer.where(football_team_id: @team.id)
    end
  end

  def new
    @team = FootballTeam.find(params[:id])
  end

  def create
    @team = FootballTeam.find(params[:id])
    player = @team.football_players.create!(fbtp_params)
    redirect_to "/football_teams/#{@team.id}/players"
  end

    private
      def fbtp_params
        params.permit(:name, :eligible, :jersey_number, :football_team_id)
      end

end
