Rails.application.routes.draw do
  resource :logos
  resources :companies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
