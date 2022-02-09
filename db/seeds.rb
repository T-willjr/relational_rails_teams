# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
team2 = FootballTeam.create!(name: "Georgia Tech", public: true, titles: 1)
team1 = FootballTeam.create!(name: "Georgia Bulldogs", public: false, titles: 2)
player1 = team1.football_players.create!(name: "Paul Leonard",
                                                jersey_number: 69,
                                                eligible: true)
player2 = team1.football_players.create!(name: "Matthew Stafford",
                                                jersey_number: 9,
                                                eligible: true)
player3 = team2.football_players.create!(name: "Calvin Johnson",
                                                jersey_number: 81,
                                                eligible: false)

team = BasketballTeam.create!(name: "Atlanta Hawks", winning_record: true, titles: 1)
team2 = BasketballTeam.create!(name: "Atlanta Dream", winning_record: true, titles: 0)
player = team.basketball_players.create!(name: "Trae Young", injured: true, jersey_number: 11)
player2 = team.basketball_players.create!(name: "John Collins", injured: false, jersey_number: 20)
player3 = team2.basketball_players.create!(name: "Odyssey Sims", injured: false, jersey_number: 0)
