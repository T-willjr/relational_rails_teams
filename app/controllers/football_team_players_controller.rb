class FootballTeamPlayersController < ApplicationController

  def index
    @team = FootballTeam.find(params[:id])
    @players = FootballPlayer.where(football_team_id: @team.id)
  end

end
