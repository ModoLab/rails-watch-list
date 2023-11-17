Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "lists#index"

  resources :lists do
      resources :bookmarks
  end
  resources :bookmarks
end


Rails.application.routes.draw do
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks

  # Pour la ressource Movie, cela dépend de la manière dont vous souhaitez l'utiliser.
  # Si Movie est une ressource indépendante, vous pouvez le définir comme suit :
  resources :movies

  # Si Movie est utilisé à travers les bookmarks et les lists, vous pouvez le définir de manière imbriquée :
  resources :movies do
    resources :bookmarks, only: [:new, :create]
  end
end
