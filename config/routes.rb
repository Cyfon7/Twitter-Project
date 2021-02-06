Rails.application.routes.draw do

  resources :tweets
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/home', to: "home#index", as: "home"

end
