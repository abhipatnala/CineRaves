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
	watch.UserId=current_user.id
	watch.MovieId=params[:MovieID]
	watch.save
   session[:mid]=params[:MovieID]
	redirect_to  :controller => 'pages', :action => 'description'
end
def Not_intrested
	dislike =Nointrest.new
	dislike.UserId=current_user.id
	dislike.MovieId=params[:MovieID]
	dislike.save
 session[:mid]=params[:MovieID]
	redirect_to  :controller => 'pages', :action => 'description'
end
 def remove_watchlist
 
 	Watchlist.where(Userid:current_user.id,MovieId:params[:MovieID]).destroy_all
 	session[:mid]=params[:MovieID]
	redirect_to  :controller => 'pages', :action => 'description'
 end 
 def remove_not_intrested
 	Nointrest.where(Userid: current_user.id,MovieId: params[:MovieID]).destroy_all
 	session[:mid]=params[:MovieID]
	redirect_to  :controller => 'pages', :action => 'description'
end

def viewlist
	if(params[:listtype]=="1")
	list=Watchlist.where(Userid:current_user.id).pluck(:MovieId)
else
	list=Nointrest.where(Userid:current_user.id).pluck(:MovieId)
end
list.each do |key|
      #puts key['movie']['ids']['imdb']
      @WatchlistArray.push (JSON.parse (RestClient.get "http://www.omdbapi.com/?i="+key.to_s))
     
    end



end

  def failure
  end
end
