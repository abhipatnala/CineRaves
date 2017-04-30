Rails.application.routes.draw do


  get   '/login', :to => 'sessions#new', :as => :login
#match '/auth/verify', :to => 'sessions#create',:via => [:get,:post]
devise_for :users, controllers: { omniauth_callbacks:  'omniauth_callbacks' }
match '/auth/failure', :to => 'sessions#failure',:via => [:get,:post]

match 'pages/oAuth' => 'pages#oAuth', :as => :newbill, :via => [:get]
  
  get 'pages/index'


  root  'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
