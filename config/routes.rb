Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/basketball_teams', to: 'basketball_teams#index'
  get '/basketball_teams/:id', to: 'basketball_teams#show'
  get '/basketball_players', to: 'basketball_players#index'

  get '/football_teams', to: 'football_teams#index'
  get '/football_teams/:id', to: 'football_teams#show'

  get '/football_players', to: 'football_players#index'
end
