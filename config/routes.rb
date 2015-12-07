Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create', defaults: { format: 'json' }
  get 'auth/signout', to: 'sessions#destroy', defaults: { format: 'json' }

  resources :sessions, only: [:index, :create, :destroy], defaults: { format: 'json' }

  namespace :api, defaults: { format: 'json' } do
    resources :home, only: [:index]

    resources :groups, only: [:index, :create] do
      collection do
        get 'near'
      end
    end

    resources :group_users, only: [:show, :create]
  end

  root to: 'home#index', defaults: { format: 'json' }
end
