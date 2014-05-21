Bloccit::Application.routes.draw do
  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

  default_url_options host: 'localhost:3000'
  devise_for :users
  resources :topics
  resources :posts

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end