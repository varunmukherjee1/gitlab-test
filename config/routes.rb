require "sidekiq/web"

Rails.application.routes.draw do
  root to: "events#index"

  resources :events

  # Sidekiq dashboard. Add authentication before exposing this in a real app.
  mount Sidekiq::Web => "/sidekiq"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
