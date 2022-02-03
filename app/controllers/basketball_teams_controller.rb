class BasketballTeamsController < ApplicationController
  def index
    @teams = BasketballTeam.all.order_by_most_recently_created
  end

  def show
    @team = BasketballTeam.find(params[:id])
  end

  def players
    show
    @players = @team.basketball_players
  end
end
