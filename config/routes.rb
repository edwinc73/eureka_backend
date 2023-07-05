Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :recipes, only: %i[show create index update]
      resources :meals, only: %i[show create index]
      resources :goals, only: %i[show create index]
    end
  end
end
