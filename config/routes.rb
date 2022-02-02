Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/basketballteams', to: 'basketball_teams#index'
  get '/basketballteams/:id', to: 'basketball_teams#show'

  get '/football_teams', to: 'football_teams#index'
  get '/football_teams/:id', to: 'football_teams#show'
end
