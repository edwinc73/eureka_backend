Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      resources :users, only: %i[update]
      get 'profile', to: 'users#profile'
      get 'suggestion', to: 'recipes#suggestion'
      resources :goals, only: %i[show index update]
      get 'weekly_goals', to: 'goals#weekly_goals'
      resources :recipes, only: %i[show create index update] do
        member do
          post 'add_review'
          post 'upload_img'
          resources :preps, only: %i[index destroy update]
        end
      end
      resources :favourite_recipes, only: %i[create]
      delete 'favourite_delete', to: 'favourite_recipes#cancel'
      post 'add_to_goal', to: 'recipes#add_to_goal'
      resources :meals, only: %i[index destroy]
      resources :favourite_recipes, only: %i[index]
      get 'ingredients', to: 'ingredients#index'
    end
  end
end
