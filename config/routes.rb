Rails.application.routes.draw do
  get 'rooms/index'

  devise_for :users, controllers: { registrations: 'users/registrations'}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"


  resources :users, only: [:index, :show]
  resources :articles do
    resources :comments
  end
  resources :categories
  resources :rooms do
    resources :messages
  end


end



# URL helper

# get "/article/:id", to: "articles#show", as: :article