class FootballTeamsController < ApplicationController

  def index
    @teams = FootballTeam.order_by_most_recently_created
  end

  def show
    @team = FootballTeam.find(params[:id])
  end

  def new

  end
end
