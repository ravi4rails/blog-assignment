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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
