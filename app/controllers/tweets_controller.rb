class TweetsController < ApplicationController


    get '/tweets' do
        if logged_in?
        @tweets = Tweet.all
        erb :'tweets/tweets'
        else
         redirect to    '/login'
        end
    end


get '/tweets/new' do
    if logged_in?
    erb :'tweets/new'
    else
     redirect to    '/login'
    end
end

post '/tweets' do

    if params[:content] == ""
        redirect   '/tweets/new'
    elsif logged_in?
        @tweet = Tweet.find_or_create_by(content: params[:content])
        @tweet.user_id = session[:user_id]
        @tweet.save

        redirect "/tweets/#{@tweet.id}"
    else
        redirect "/login"
    end
end

get '/tweets/:id' do
    if logged_in?
   @tweet = Tweet.find(params[:id])
<<<<<<< HEAD
  
    erb :'/tweets/show_tweet'  
=======
    erb :'/tweets/show_tweet'
>>>>>>> d85312a3b3534a171b8d48706a00ddc5660efc02
    else
        redirect "/login"
    end
end

get '/tweets/:id/edit' do
    if !logged_in?
        redirect "/login"

    else
     @tweet = Tweet.find(params[:id])
    #binding.pry
    erb :'tweets/edit_tweet'
    end
end

patch '/tweets/:id' do
    if !logged_in?
        redirect "/login"
    elsif params[:content] == ""
        redirect   "/tweets/#{params[:id]}/edit"
    else
    var = Tweet.find(params[:id])
    params.delete("_method")
    var.update(params)

    redirect "/tweets/#{var.id}"
    end

<<<<<<< HEAD
    delete '/tweets/:id'  do 

        var = Tweet.find(params[:id])
        binding.pry
=======
    delete '/tweets/:id'  do
       binding.pry
        var = Tweet.find(params[:id])

>>>>>>> d85312a3b3534a171b8d48706a00ddc5660efc02
        if logged_in? &&  current_user[:id] == var.user_id
        var.delete
        redirect "/tweets"
        else
            redirect "/login"
        end
    end

end








end
