class FootballPlayersController < ApplicationController

  def index
    @players = FootballPlayer.all
  end

  def show
    @player = FootballPlayer.find(params[:id])
  end

  def edit
    @player = FootballPlayer.find(params[:id])
  end
end
