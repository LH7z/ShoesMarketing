Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  root to: "pages#home"
  resources :products, only: [ :new, :create, :index, :show ]
  resources :highlights, only: [ :new, :create, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
