Rails.application.routes.draw do
  root "spots#top"

  get "spots/top" => "spots#top", as: "top"
  devise_for :administrators, controllers: {
    sessions:      'administrators/sessions',
    passwords:     'administrators/passwords',
    registrations: 'administrators/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users
  resources :administrators
  resources :spots do
    resources :like_comments
    resources :likes, :only => [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
