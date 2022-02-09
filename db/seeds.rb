BasketballTeam.destroy_all
BasketballPlayer.destroy_all
FootballTeam.destroy_all
FootballPlayer.destroy_all

@team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
@team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
@team3 = BasketballTeam.create!(name: "Georgia Southern Eagles", winning_record: true, titles: 0)
@team4 = BasketballTeam.create!(name: "Georgia Tech", winning_record: false, titles: 0)

@player = @team.basketball_players.create!(name: "Trae Young", injured: true, jersey_number: 11)
@player2 = @team.basketball_players.create!(name: "John Collins", injured: true, jersey_number: 20)
@player3 = @team2.basketball_players.create!(name: "Odyssey Sims", injured: true, jersey_number: 0)
@player4 = @team3.basketball_players.create!(name: "Jordan Usher", injured: false, jersey_number: 4)

fteam2 = FootballTeam.create!(name: "Georgia Tech", public: true, titles: 1)
fteam1 = FootballTeam.create!(name: "Georgia Bulldogs", public: false, titles: 2)
fplayer1 = fteam1.football_players.create!(name: "Paul Leonard",
                                                jersey_number: 69,
                                                eligible: true)
fplayer2 = fteam1.football_players.create!(name: "Matthew Stafford",
                                                jersey_number: 9,
                                                eligible: true)
fplayer3 = fteam2.football_players.create!(name: "Calvin Johnson",
                                                jersey_number: 81,
                                                eligible: false)
