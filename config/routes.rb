Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions:             'users/sessions',
    passwords:            'users/passwords',
    registrations:        'users/registrations',
    confirmations:        'users/confirmations',
    ominiauth_callbacks:  'users/ominiauth_callbacks',
    unlocks:              'users/unlocks'
  }
  root 'home#index'

  resources :articles
  resources :users do 
    member do 
      get   :change_role
      patch :update_role
    end
    collection do 
      post  :create_user
      patch :update_user
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
