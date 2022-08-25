Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :libraries
    end
  end
end
