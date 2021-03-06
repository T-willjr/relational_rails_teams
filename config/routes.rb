Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/basketball_teams', to: 'basketball_teams#index'
  get '/basketball_teams/new', to: 'basketball_teams#new'
  get '/basketball_teams/:id', to: 'basketball_teams#show'
  get '/basketball_teams/:id/edit', to: 'basketball_teams#edit'
  post '/basketball_teams', to: 'basketball_teams#create'
  patch '/basketball_teams/:id', to: 'basketball_teams#update'
  delete '/basketball_teams/:id', to: 'basketball_teams#destroy'

  get '/basketball_players', to: 'basketball_players#index'
  get '/basketball_players/:id', to: 'basketball_players#show'
  get '/basketball_players/:id/edit', to: 'basketball_players#edit'
  patch '/basketball_players/:id', to: 'basketball_players#update'
  delete '/basketball_players/:id', to: 'basketball_players#destroy'

  get '/basketball_teams/:id/players', to: 'basketball_team_players#index'
  get '/basketball_teams/:id/players/new', to: 'basketball_team_players#new'
  post '/basketball_teams/:id/players', to: 'basketball_team_players#create'



  get '/football_teams', to: 'football_teams#index'
  get '/football_teams/new', to: 'football_teams#new'
  get '/football_teams/:id', to: 'football_teams#show'
  post '/football_teams', to: 'football_teams#create'
  get '/football_teams/:id/edit', to: 'football_teams#edit'
  patch '/football_teams/:id', to: 'football_teams#update'
  delete '/football_teams/:id/destroy', to: 'football_teams#destroy'

  get '/football_players', to: 'football_players#index'
  get '/football_players/:id', to: 'football_players#show'
  get 'football_players/:id/edit', to: 'football_players#edit'
  patch 'football_players/:id', to: 'football_players#update'
  delete '/football_players/:id/destroy', to: 'football_players#destroy'

  get '/football_teams/:id/players', to: 'football_team_players#index'
  get '/football_teams/:id/players/new', to: 'football_team_players#new'
  post '/football_teams/:id/players', to: 'football_team_players#create'
end
