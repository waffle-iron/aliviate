Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  namespace :admin do
    root to: "dashboards#index"
    resources :posts,    except: [:show]
    resources :products, except: [:show]
  end

  root "pages#home"
  get "/about", to: "pages#about"

  resources :contacts, only: [:new, :create]
end
