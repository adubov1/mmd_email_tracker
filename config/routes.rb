EmailTracker::Engine.routes.draw do
  resources :emails
  get '/o/:track_id', to: 'opens#open'
end
