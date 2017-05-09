class PagesController < ApplicationController


session[:token]=""
  def index
  
  if(Token.count ==0)
  	
  	require 'oauth2'
         client = OAuth2::Client.new('6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4', '5e1c6d482224119ba52e794f7f8aaf8a9a08fc7fb612efd0c23b87dda7a1fad1', :site => 'https://trakt.tv')
        sCheck=cineraves_code_url.to_s
        @authorize_url =client.auth_code.authorize_url(:redirect_uri => sCheck, :response_type => 'code')

        redirect_to  @authorize_url
else
	
@check = Token.first

session[:token]=@check.value

redirect_to :action => 'home'
	
	end
  	end

  	

  	  def home


  	  	if(session[:token]!='nil' )
          puts session[:token]
  	  	
        require 'uri'
        require 'net/http'

          @code = params[:code]
         
          body = {
            code: @code,
            client_id: "6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4",
            client_secret: "5e1c6d482224119ba52e794f7f8aaf8a9a08fc7fb612efd0c23b87dda7a1fad1",
            redirect_uri: cineraves_code_url,
            grant_type: "authorization_code"
          }
          request = RestClient.post "https://api.trakt.tv/oauth/token", body.to_json, content_type: 'application/json'
          @AuthToken = JSON.parse(request.body)
puts @AuthToken.to_s
          apptoken= Token.create(value: @AuthToken["access_token"].to_s)
          session[:token]=@AuthToken["access_token"].to_s
          apptoken.save
      
  	  	else

  	  	end


        trendingurl="https://api.trakt.tv/movies/trending?access_token="+ session[:token]
       url = URI(trendingurl)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["content-type"] = 'application/json'
      request["trakt-api-version"] = '2'
      request["trakt-api-key"] = '6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4'
      response = http.request(request)
      @trendArray =[]
      @trendingMovies =JSON.parse(response.body)
      @trendingMovies.each do |key, value|
      #puts key['movie']['ids']['imdb']
      @trendArray.push (JSON.parse (RestClient.get "http://www.omdbapi.com/?i="+key['movie']['ids']['imdb'].to_s))
    end
     popularurl="https://api.trakt.tv/movies/popular?access_token="+ session[:token]
       url = URI(popularurl)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["content-type"] = 'application/json'
      request["trakt-api-version"] = '2'
      request["trakt-api-key"] = '6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4'
      response = http.request(request)
      @popularArray =[]
      @popularMovies =JSON.parse(response.body)
      @popularMovies.each do |key, value|
      #puts key['movie']['ids']['imdb']

      @popularArray.push (JSON.parse (RestClient.get "http://www.omdbapi.com/?i="+key['ids']['imdb'].to_s))

     
    end

    boxofficeurl="https://api.trakt.tv/movies/boxoffice?access_token="+ session[:token]
       url = URI(boxofficeurl)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["content-type"] = 'application/json'
      request["trakt-api-version"] = '2'
      request["trakt-api-key"] = '6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4'
      response = http.request(request)
      @boxofficeArray =[]
      @boxofficeMovies =JSON.parse(response.body)
      
      @boxofficeMovies.each do |key, value|
      #puts key['movie']['ids']['imdb']
     

      @boxofficeArray.push (JSON.parse (RestClient.get "http://www.omdbapi.com/?i="+key['movie']['ids']['imdb'].to_s))

     
    end
         
        end
def description
     @movie= JSON.parse (RestClient.get "http://www.omdbapi.com/?i="+params[:mid].to_s)
    
     end

end
