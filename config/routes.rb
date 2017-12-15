Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  # SESSION ROUTES
  post "/sessions" => "sessions#create", as: "login"
  delete "/session/:id" => "sessions#destroy", as: "logout"

  # USER ROUTES
  post "/users" => "users#create", as: "register"
  get "/users/:id" => "users#show", as: "user"

  # ATTENDEE ROUTES
  post "/playlists" => "playlists#create", as: "add_playlist"

  # SONG ROUTES
  get "/songs" => "songs#index", as: "songs"
  post "/songs" => "songs#create", as: "create_song"
  get "/songs/:id" => "songs#show", as: "song"
end
