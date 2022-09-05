Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :libraries, only: %i[index]
      resources :administrations, only: %i[index show]
      resources :services, only: %i[index show]
    end
  end
end
