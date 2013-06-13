Reddit::Application.routes.draw do
  resources :users
  resources :links, :except => :index do
    get '/comments/:id' => 'comments#show', :as => 'comment'
    post '/comments' => 'comments#create'

  end

  resources :subs do
    resources :links, :only => [:index]
  end




  get '/login' => 'session#new'
  post '/login' => 'session#create'

  delete '/logout' => 'session#destroy'
end
