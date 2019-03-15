class TweetsController < ApplicationController


    get '/tweets' do
        if logged_in?
        @tweets = Tweet.all 
        erb :'tweets/tweets'
        else 
         redirect to    '/signin'  
        end
    end  
    

get '/tweets/new' do
    erb :'tweets/new'

end 

post '/tweets' do
    tweet = Tweet.create(content: params[:content])
redirect "/tweets/#{tweet.id}"
end  

get '/tweets/:id' do 
    @tweet = Tweet.find_by(params[:id])
    erb :'/tweets/show_tweet'  
end 

get '/tweets/:id/edit' do
    @tweet = Tweet.find_by(params[:id])
    #binding.pry  
    erb :'tweets/edit_tweet'
end 

patch '/tweets/:id' do
    binding.pry  

redirect "/tweets/#{tweet.id}"
end 








end
