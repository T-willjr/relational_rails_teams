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

  def edit
    @team = BasketballTeam.find(params[:id])
  end

  def update
    team = BasketballTeam.find(params[:id])
    team.update(basketball_team_params)
    redirect_to "/basketball_teams/#{team.id}"
  end

  def destroy
    BasketballTeam.destroy(params[:id])
    redirect_to "/basketball_teams"
  end

  private

  def basketball_team_params
    params.permit(:name, :winning_record, :titles)
  end
end
