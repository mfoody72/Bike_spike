Rails.application.routes.draw do
  devise_for :users

  resources :bikes do
  	resources :bookeddays	
  	resources :comments, except: [:show, :index]
  	resources :reservations, except: [:show, :index]
  end
  
  root 'bikes#index'
end
