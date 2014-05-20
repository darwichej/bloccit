Bloccit::Application.routes.draw do
  default_url_options host: 'localhost:3000'
  devise_for :users
  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end