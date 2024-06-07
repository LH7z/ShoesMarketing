Rails.application.routes.draw do
  # get 'orders/index'
  # get 'orders/show'
  # get 'orders/new'
  # get 'carts/show'
  devise_for :users, :controllers => {registrations: 'users/registrations'}
  root to: "pages#home"
  # get 'shopcart', to: 'pages#shopcart', as: 'shopcart'
  patch "users/:id", to: "users#update", as: 'update_profile'
  resources :products, only: [ :new, :create, :index, :show ] do
    post :sort_cat
  end
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"

  post 'line_items/:id/size' => "line_items#change_size", as: "line_item_change_size"

  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
