class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def trakt
    #You need to implement the method below in your model (e.g. app/models/user.rb)
    #require "uri"
#require "net/http"


#params1 = {'code' => params["code"],'client_id' =>'6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4','client_secret' =>'5e1c6d482224119ba52e794f7f8aaf8a9a08fc7fb612efd0c23b87dda7a1fad1',
  #'redirect_uri' =>'https://agile-island-15771.herokuapp.com/users/auth/trakt/callback','grant_type' => 'authorization_code'
#}
# @x = Net::HTTP.post_form(URI.parse('https://api.trakt.tv/oauth/token'), params1)

 
 require 'uri'
require 'net/http'

url = URI("https://api.trakt.tv/oauth/token")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

@request = Net::HTTP::Post.new(url)
@request["content-type"] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
@request["cache-control"] = 'no-cache'
@request["postman-token"] = '615d2669-a90d-ef12-f7e2-0af26bcf2bb7'
@request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"code\"\r\n\r\n"+params["code"].to_s+"\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"client_id\"\r\n\r\n6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"client_secret\"\r\n\r\n5e1c6d482224119ba52e794f7f8aaf8a9a08fc7fb612efd0c23b87dda7a1fad1\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"redirect_uri\"\r\n\r\nhttps://agile-island-15771.herokuapp.com/\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"grant_type\"\r\n\r\nauthorization_code\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

@response = http.request(request)

  end
end