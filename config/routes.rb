Rails.application.routes.draw do
  # Creamos las rutas
  namespace :api do
    # First Version
    namespace :v1 do
      resources :users
      resources :family_goal
    end
end
end
