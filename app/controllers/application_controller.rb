class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  	class TwitterSearch
		def initialize()
			@client = Twitter::REST::Client.new do |config|
				#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
				# const_set(OpenSSL::SSL::VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
	  			config.consumer_key        = "EWTW1jIwPmOaedQ5Xv0Qg8jNK"
	  			config.consumer_secret     = "KpKzTLHCOEd3BfsW9LMcq6ARDuxWtWNWUjNFXEQK6g5P1F8GJ9"
	  			config.access_token        = "3000402579-SUbmHZnAoArtce13Qg5ZP6u9u3iNQMA2NeXIZTr"
	  			config.access_token_secret = "tUPSwniuvQY6M2JhvpbHg2Qy1Hn0V941QlBwRFeUQaeKN"
	  		end
	  		return @client
	  	end

	  	def search(query, how_many_tweets)
	  		@search = @client.search(query, result_type: "recent").take(how_many_tweets).collect do |tweet|
	  			  "#{tweet.user.screen_name}: #{tweet.text}" 
	  		end
	  	end
	end
end
