Rails.application.routes.draw do
  resources :bikes
  root 'bikes#index'
end
