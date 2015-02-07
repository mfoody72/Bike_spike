Rails.application.routes.draw do
  devise_for :users
  resources :bikes
  root 'bikes#index'
end
