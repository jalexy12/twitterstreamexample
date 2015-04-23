class TwitterStreamerController < ApplicationController
	  respond_to :html, :xml, :json

  include Twitter
	def index
		@twitter = TwitterSearch.new
		@tweets = @twitter.search("Justin Bieber", 10)
		respond_to do |format|
			format.json {render json: @tweets}
			format.html {render :index}
		end
	      # if @query.present?
	      #   render json: {tweets:  @query }
	      # else
	      #   render json: {tweets: "No tweets for you son..."}
	      # end
	end


end
