Rails.application.routes.draw do

  # Routes for the Friend resource:
  # CREATE
  get "/friends/new", :controller => "friends", :action => "new"
  post "/create_friend", :controller => "friends", :action => "create"

  # READ
  get "/friends", :controller => "friends", :action => "index"
  get "/friends/:id", :controller => "friends", :action => "show"

  # UPDATE
  get "/friends/:id/edit", :controller => "friends", :action => "edit"
  post "/update_friend/:id", :controller => "friends", :action => "update"

  # DELETE
  get "/delete_friend/:id", :controller => "friends", :action => "destroy"
  #------------------------------

  root to: "sessions#index"

  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  get "/signout" => "sessions#destroy", :as => :signout
  get '/friends', :controller => 'friends', :action => "index"




  # # Routes for the User resource:
  # # CREATE
  # get "/users/new", :controller => "users", :action => "new"
  # post "/create_user", :controller => "users", :action => "create"

  # # READ
  # get "/users", :controller => "users", :action => "index"
  # get "/users/:id", :controller => "users", :action => "show"

  # # UPDATE
  # get "/users/:id/edit", :controller => "users", :action => "edit"
  # post "/update_user/:id", :controller => "users", :action => "update"

  # # DELETE
  # get "/delete_user/:id", :controller => "users", :action => "destroy"
  # #------------------------------


end
