Rails.application.routes.draw do


  get   '/login', :to => 'sessions#new', :as => :login
match '/auth/:provider/callback', :to => 'sessions#create',:via => [:get,:post]
match '/auth/failure', :to => 'sessions#failure',:via => [:get,:post]

match 'pages/oAuth' => 'pages#oAuth', :as => :newbill, :via => [:get]
  devise_for :users
  get 'pages/index'


  root  'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
