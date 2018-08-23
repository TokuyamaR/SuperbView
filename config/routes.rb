Rails.application.routes.draw do
  root "spots#top"

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

  # 下記3行はログアウト時のrooting error解決のために記載
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, :except => [:show]

  resources :spots do
    resources :like_comments
    resource :likes, :only => [:create, :destroy]
  end

# users
  # ユーザー
  get "users/:id/show_likes" => "users#show_likes", as: "user_show_likes"
  get "users/:id/show_comments" => "users#show_comments", as: "user_show_comments"
  get 'service' => 'users#service', as:'service'
  get 'privacy' => 'users#privacy', as:'privacy'
  get 'contact' => 'users#contact', as:'contact'
  # 管理者
  get "admin/users" => "users#admin_index", as: "admin_users"
  get "admin/users/:user_id" => "users#admin_show", as: "admin_show_user"
  delete "admin/users/:user_id" => "users#admin_destroy", as: "admin_destroy_user"

# spots
  # ユーザー
  # 管理者
  get "admin/spots" => "spots#admin_index", as: "admin_spots"
  get "admin/spots/:spot_id/show" => "spots#admin_show", as: "admin_show_spot"
  get "admin/spots/:spot_id/edit" => "spots#admin_edit", as: "admin_edit_spot"
  patch 'admin/spots/:spot_id/edit' => 'spots#admin_update', as: 'admin_update_spot'
  delete "admin/spots/:spot_id" => "spots#admin_destroy", as: "admin_destroy_spot"

# like_comments
  # ユーザー
  # 管理者
  get "admin/like_comments" => "like_comments#admin_index", as: "admin_like_comments"
  delete "admin/like_comments/:id" => "like_comments#admin_destroy", as: "admin_destroy_like_comment"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
