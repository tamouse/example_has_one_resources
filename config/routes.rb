Rails.application.routes.draw do
  resources :companies do
    resource :logos
  end
end
