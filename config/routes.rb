Reddit::Application.routes.draw do
  resources :users
  resources :subs do
    resources :links
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'

  delete '/logout' => 'session#destroy'
end
