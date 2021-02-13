Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Active Admin (installed by default)
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #Devise routes for Users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  resources :likes
  resources :tweets

  root "home#index"

  get '/home', to: "home#index", as: "home"

  #Route for search action
  post '/home', to: "home#do_search", as: "do_search"
  
  #Route for generating json with the last 50 tweets
  get 'api/news', to: "tweets#news"  

  get 'api/:date1/:date2', to: "tweets#tweets_btw_dates"
end
