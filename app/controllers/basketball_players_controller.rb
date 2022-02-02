class BasketballPlayersController < ApplicationController
  def index
    @players = BasketballPlayer.all
  end
end
