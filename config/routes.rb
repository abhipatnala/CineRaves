Rails.application.routes.draw do


  get   '/login', :to => 'sessions#new', :as => :login
#match '/auth/verify', :to => 'sessions#create',:via => [:get,:post]
devise_for :users
match '/auth/failure', :to => 'sessions#failure',:via => [:get,:post]

match 'sessions/save_comments', :to => 'sessions#save_comments',:via => [:post]

  
  get 'pages/index'
  get '/cineraves/code_callback', :to => 'pages#home', :as => :cineraves_code
get '/cineraves/description', :to=>'pages#description', :as => :description

  root  'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
