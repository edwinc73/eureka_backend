Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      resources :users, only: %i[show update]
      get 'suggestion', to: 'recipes#suggestion'
      resources :goals, only: %i[show create index update]
      resources :recipes, only: %i[show create index update] do
        member do
          post 'add_review'
          post 'upload_img'
          resources :favourite_recipes, only: %i[create destroy]
        end
      end
      resources :meals, only: %i[show create index]
      resources :favourite_recipes, only: %i[index]
    end
  end
end
