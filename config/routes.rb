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

  resources :users, :except => [:show]
  resources :administrators
  resources :spots do
    resources :like_comments
    resources :likes, :only => [:create, :destroy]
  end

  get "users/show_likes" => "users#show_likes", as: "user_show_likes"
  get "users/show_comments" => "users#show_comments", as: "user_show_comments"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
