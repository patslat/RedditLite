Reddit::Application.routes.draw do
  resources :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'

  delete '/logout' => 'session#destroy'
end
