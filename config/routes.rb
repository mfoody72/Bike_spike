Rails.application.routes.draw do
  devise_for :users
  resources :bikes do
  	resources :comments
  end
  root 'bikes#index'
end
