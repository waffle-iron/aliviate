Rails.application.routes.draw do

  devise_for :users
  namespace :admin do
    root to: "dashboards#index"
  end

  root 'pages#home'

end
