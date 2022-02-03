class BasketballPlayersController < ApplicationController
  def index
    @players = BasketballPlayer.all
  end

  def show
    @player = BasketballPlayer.find(params[:id])
  end
end
