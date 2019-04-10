require 'dotenv'

Dotenv.load('../.env')

      # ligne très importante qui appelle la gem.
require 'twitter'

     # n'oublie pas les lignes pour Dotenv ici…
 
		 # quelques lignes qui appellent les clés d'API de ton fichier .env
def login_twitter
  client = Twitter::REST::Client.new do |config|
   config.consumer_key        = ENV["TWITTER_API_KEY"]
   config.consumer_secret     = ENV["TWITTER_API_SECRET_KEY"]
   config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
   config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
end

# ligne qui permet de tweeter sur ton compte
#client.update('Mon premier tweet en Ruby !!!!')

#def follow_hello(client)
#  client.search("#Hello_World", result_type: "recent").take(20).map do |tweet|
#    client.follow(tweet.user)
#  end
#end

def favorite(client)
	ensemble = client.search("#bonjour_monde", result_type: "recent").take(25)
#	ensemble.each do |tweet|
		client.favorite(ensemble)
#	end
end

open_t = login_twitter
favorite(open_t)