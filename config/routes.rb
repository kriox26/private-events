Rails.application.routes.draw do
  root 'static_pages#home'
  get    'signup' => 'users#new'
  get 	 'login'  => 'session#new'
  post 	 'login'  => 'session#create'
  delete 'logout' => 'session#destroy'
  resources :users, only: [ :new, :create, :show ]
end
