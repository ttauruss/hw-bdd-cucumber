Rottenpotatoes::Application.routes.draw do
  post '/movies/search_tmdb'
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
