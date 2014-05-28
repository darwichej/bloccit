Bloccit::Application.routes.draw do

  get 'comments/new'

  #default_url_options host: 'localhost:3000'
  devise_for :users
  resources :users, only: [:update]
  
  resources :topics do
    resources :posts, except: [:index]
      resources :comments, only: [:create]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end