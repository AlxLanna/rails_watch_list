Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, only: [ :index, :show, :new, :create, :destroy ] do
    resources :bookmarks, only: [ :new, :create ] do
      resources :movies
    end
  end
    resources :bookmarks

  # Defines the root path route ("/")
  # root "articles#index"
end
