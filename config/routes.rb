EmailTracker::Engine.routes.draw do
  resources :emails
  get '/o', to: 'opens#open'
end
