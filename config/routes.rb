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

  resources :articles do 
    resources :comments
  end
  resources :users do 
    member do 
      get   :change_role
      patch :update_role
      get   :change_status
      patch :update_status
    end
    collection do 
      post  :create_user
      patch :update_user
    end
  end

  resources :comment_feedbacks

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
