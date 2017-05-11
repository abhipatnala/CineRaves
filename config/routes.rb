Rails.application.routes.draw do


  get   '/login', :to => 'sessions#new', :as => :login
#match '/auth/verify', :to => 'sessions#create',:via => [:get,:post]
devise_for :users,:controllers => { :omniauth_callbacks => "omniauth_callbacks" }
match '/auth/failure', :to => 'sessions#failure',:via => [:get,:post]

match 'sessions/save_comments', :to => 'sessions#save_comments',:via => [:post]

  match 'sessions/Add_watchlist', :to => 'sessions#Add_watchlist',:via => [:post]
match 'sessions/Not_intrested', :to => 'sessions#Not_intrested',:via => [:post]
match 'sessions/remove_watchlist', :to => 'sessions#remove_watchlist',:via => [:post]

match 'sessions/remove_not_intrested', :to => 'sessions#remove_not_intrested',:via => [:post]
  get 'pages/index'
  get 'pages/index'
  get '/cineraves/code_callback', :to => 'pages#home', :as => :cineraves_code
get '/cineraves/description', :to=>'pages#description', :as => :description
match '/cineraves/ViewAll', :to=>'pages#viewall', :as => :ViewAll , :via => [:get,:post]
match '/cineraves/viewlist', :to => 'sessions#viewlist',  :as => :viewlist, :via => [:get,:post]
  root  'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
