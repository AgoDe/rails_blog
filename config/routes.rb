Rails.application.routes.draw do
  resources :categories
  devise_for :users, controllers: { registrations: 'users/registrations'}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

# come definire le singole rotte
  # get "/articles",      to: "articles#index" 
  # get "/articles/:id",  to: "articles#show"

# per create le rotte delle CRUD di un model

  
  resources :users, only: [:index, :show]
  resources :articles do
    resources :comments
  end
  


  
end

# comando per vedere tutte le rotte
# bin/rails routes


# URL helper

# get "/article/:id", to: "articles#show", as: :article