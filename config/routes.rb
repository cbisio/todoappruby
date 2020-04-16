Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
 
  get "/health" , to: 'health#health'
  post "/auth/login", to: "authentication#login"
  post "/signup", to: "users#create"
  
  resources :todos do
      resources :tasks
  end
   
end
