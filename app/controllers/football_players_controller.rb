class FootballPlayersController < ApplicationController

  def index
    @players = FootballPlayer.eligibility_filter
  end

  def show
    @player = FootballPlayer.find(params[:id])
  end

  def edit
    @player = FootballPlayer.find(params[:id])
  end

  def update
    player = FootballPlayer.find(params[:id])
    player.update(fbp_params)
    redirect_to "/football_players/#{player.id}"
  end

  def destroy
    player = FootballPlayer.find(params[:id])
    player.destroy
    redirect_to "/football_players"
  end


    private

      def fbp_params
        params.permit(:name, :eligible, :jersey_number, :football_team_id)
      end
end
