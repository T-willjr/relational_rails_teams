Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/basketball_teams', to: 'basketball_teams#index'
  get '/basketball_teams/:id', to: 'basketball_teams#show'
  get '/basketball_teams/:id/players', to: 'basketball_team_players#index'
  get '/basketball_players', to: 'basketball_players#index'
  get '/basketball_players/:id', to: 'basketball_players#show'


  get '/football_teams', to: 'football_teams#index'
  get '/football_teams/new', to: 'football_teams#new'
  get '/football_teams/:id', to: 'football_teams#show'
  post '/football_teams', to: 'football_teams#create'

  get '/football_players', to: 'football_players#index'
  get '/football_players/:id', to: 'football_players#show'

  get '/football_teams/:id/players', to: 'football_team_players#index'
end
