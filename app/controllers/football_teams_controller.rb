class FootballTeamsController < ApplicationController

  def index
    @teams = FootballTeam.all
  end
end
