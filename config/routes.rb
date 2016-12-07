Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  namespace :admin do
    root to: "dashboards#index"
    resources :posts, except: [:show]
  end

  root "pages#home"
  get "/about", to: "pages#about"

  resources :contacts, only: [:new, :create]
<<<<<<< HEAD
  resources :users, only: [:edit, :update]
=======
  resources :users, only: [:show, :edit, :update]
>>>>>>> 5895a0334a419d985270980a7af326eff702c8cb

end
