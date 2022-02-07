class BasketballTeamsController < ApplicationController
  def index
    @teams = BasketballTeam.all.order_by_most_recently_created
  end

  def show
    @team = BasketballTeam.find(params[:id])
  end

  def new
  end

  def create
    team = BasketballTeam.create!(basketball_team_params)
    redirect_to "/basketball_teams"
  end

  private

  def basketball_team_params
    params.permit(:name, :public, :titles)
  end
end
