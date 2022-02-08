class BasketballPlayersController < ApplicationController
  def index
    @players = BasketballPlayer.injured?
  end

  def show
    @player = BasketballPlayer.find(params[:id])
  end

  def edit
    @player = BasketballPlayer.find(params[:id])
  end

  def update
    @player = BasketballPlayer.find(params[:id])
    @player.update(player_params)
    redirect_to "/basketball_players/#{@player.id}"
  end

  private

  def player_params
    params.permit(:name, :injured, :jersey_number)
  end
end
