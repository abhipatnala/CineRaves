class SessionsController < ApplicationController
  def new
  	
  end

 def save_comments
com= Comment.new
com.UserId =1
#com.UserId =current_user.UserId
com.MovieId=params[:MovieID]
com.description =params[:message]

com.save
session[:mid]=params[:MovieID]
redirect_to  :controller => 'pages', :action => 'description'
 	
 end
def Add_watchlist
	watch = Watchlist.new
	watch.UserId=1
	watch.MovieId=params[:MovieID]
	watch.save
   session[:mid]=params[:MovieID]
	redirect_to  :controller => 'pages', :action => 'description'
end
def Not_intrested
	dislike =Nointrest.new
	dislike.UserId=1
	dislike.MovieId=params[:MovieID]
	dislike.save
 session[:mid]=params[:MovieID]
	redirect_to  :controller => 'pages', :action => 'description'
end
 def remove_watchlist
 	byebug
 	Watchlist.where(Userid:1,MovieId:params[:MovieID]).destroy_all
 	session[:mid]=params[:MovieID]
	redirect_to  :controller => 'pages', :action => 'description'
 end 
 def remove_not_intrested
 	Nointrest.where(Userid: 1,MovieId: params[:MovieID]).destroy_all
 	session[:mid]=params[:MovieID]
	redirect_to  :controller => 'pages', :action => 'description'
end

  def failure
  end
end
