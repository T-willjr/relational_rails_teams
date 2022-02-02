class FootballPlayersController < ApplicationController

  def index
    @players = FootballPlayer.all
  end
end
