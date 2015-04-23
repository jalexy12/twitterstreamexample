Rails.application.routes.draw do
  get '/index' => 'twitter_streamer#index'
end
