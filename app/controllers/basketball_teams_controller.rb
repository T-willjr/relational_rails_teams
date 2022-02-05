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
    team = BasketballTeam.new({
    name: params[:basketball_team][:name],
    winning_record: params[:basketball_team][:winning_record],
    titles: params[:basketball_team][:titles]
    })
    team.save
    redirect_to '/basketball_teams'
  end
end
