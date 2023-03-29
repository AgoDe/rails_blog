Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations'}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

# come definire le singole rotte
  # get "/articles",      to: "articles#index" 
  # get "/articles/:id",  to: "articles#show"
  get "/chatroom",     to: "chatroom#index"

# per create le rotte delle CRUD di un model

  
  resources :users, only: [:index, :show]
  resources :articles do
    resources :comments
  end
  resources :categories
  resources :messages


  mount ActionCable.server, at: '/cable'

end

# comando per vedere tutte le rotte
# bin/rails routes


# URL helper

# get "/article/:id", to: "articles#show", as: :article