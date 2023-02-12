Rails.application.routes.draw do
  devise_for :users
  get 'login/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

# come definire le singole rotte
  # get "/articles",      to: "articles#index" 
  # get "/articles/:id",  to: "articles#show"

  get     "/login",   to: "login#new"
  post    "/login",   to: "login#create"
  delete  "/logout",  to: "login#destroy"

# per create le rotte delle CRUD di un model

  
  resources :users 
    resources :articles do
      resources :comments
    end
  


  
end

# comando per vedere tutte le rotte
# bin/rails routes
