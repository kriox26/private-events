Rails.application.routes.draw do
  # Root url, goes to home page
  root   'static_pages#home'

  # Custom urls
  get    'signup' => 'users#new'
  get 	 'login'  => 'session#new'
  post 	 'login'  => 'session#create'
  delete 'logout' => 'session#destroy'
  get 	 'events' => 'events#index'

  # Resources
  resources :users, only: [ :new, :create, :show ]
  resources :events, only: [ :new, :create, :show ]
end
