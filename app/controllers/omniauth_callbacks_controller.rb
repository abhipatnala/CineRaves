class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def trakt
    #You need to implement the method below in your model (e.g. app/models/user.rb)
    require "uri"
require "net/http"


params1 = {'code' => params["code"],'client_id' =>'6b938c19460b1a087e44da2131d779933d168f6e5ec10c6fae3ea48212e084d4','client_secret' =>'5e1c6d482224119ba52e794f7f8aaf8a9a08fc7fb612efd0c23b87dda7a1fad1',
  'redirect_uri' =>'https://agile-island-15771.herokuapp.com/users/auth/trakt/callback','grant_type' => 'authorization_code'
}
 x = Net::HTTP.post_form(URI.parse('https://api.trakt.tv/oauth/token'), params1)

puts x.body
  end
end