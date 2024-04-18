Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  root to: "pages#home"
  get 'shopcart', to: 'pages#shopcart', as: 'shopcart'
  patch "users/:id", to: "users#update", as: 'update_profile'
  resources :products, only: [ :new, :create, :index, :show ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
