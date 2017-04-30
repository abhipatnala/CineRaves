class PagesController < ApplicationController
  def index
  	
  	end

  	def oAuth
require 'uri'
require 'net/http'

url = URI("http://www.trakt.tv/?oauth_consumer_key=c64414858aa29c01a150739d54a71e770a90a676bbff6ed9330b7652685dde4e&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1493366530&oauth_nonce=kJ9bx2&oauth_version=1.0&oauth_signature=FXoaPPOoRRrbZwCiHEl0lOMi5HU%3D")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["cache-control"] = 'no-cache'
request["postman-token"] = 'e0e429f6-b385-9bfd-b988-3acaa04319ab'


response = http.request(request)


  	end

end
