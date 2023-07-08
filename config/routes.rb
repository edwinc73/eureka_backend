Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      resources :users, only: %i[show update]
      resources :recipes, only: %i[show create index update] do
        resources :favourite_recipes, only: :create
        resources :reviews, only: %i[create index]
        post 'upload_img', to: "recipes#upload_img"
      end
      resources :meals, only: %i[show create index]
      resources :goals, only: %i[show create index update]
      resources :favourite_recipes, only: :index
    end
  end
end
