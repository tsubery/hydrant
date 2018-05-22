Rails.application.routes.draw do
  resources :dogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "rails/active_storage/redis/:key", to: "redis_service#get", as: :redis_storage
end
