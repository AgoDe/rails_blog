Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

# come definire le singole rotte
  # get "/articles",      to: "articles#index" 
  # get "/articles/:id",  to: "articles#show"


# per create le rotte delle CRUD di un model
  resources :articles


  
end

# comando per vedere tutte le rotte
# bin/rails routes
