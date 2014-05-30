Bloccit::Application.routes.draw do

  #default_url_options host: 'localhost:3000'
  devise_for :users
  resources :users, only: [:update]
  
  resources :topics do
    resources :posts do
      resources :comments
    end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end