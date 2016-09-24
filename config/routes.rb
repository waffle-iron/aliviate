Rails.application.routes.draw do

  namespace :admin do
    root to: "dashboards#index"
  end

end
