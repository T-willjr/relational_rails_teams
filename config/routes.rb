Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/basketballteams', to: 'basketball_teams#index'


  get '/football_teams', to: 'football_teams#index'


  #we probably want to put spaces between each subject like bball and fball teams
end
