class FootballTeamsController < ApplicationController

  def index
    @teams = FootballTeam.order_by_most_recently_created
  end

  def show
    @team = FootballTeam.find(params[:id])
  end

  def new

  end

  def create
    team = FootballTeam.create!(football_team_params)
    redirect_to "/football_teams"
  end

  def edit
    @team = FootballTeam.find(params[:id])
  end

  private

    def football_team_params
      params.permit(:name, :public, :titles)
    end
end
