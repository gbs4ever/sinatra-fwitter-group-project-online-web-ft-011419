class UsersController < ApplicationController
  get '/signup' do
    if logged_in?
      redirect to '/tweets'
    else
    erb :"users/create_user"
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    end
    
    if User.find_by(:email => params[:email])
      redirect to '/login'
    else
      user = User.new(params)
      user.save
      session[:user_id] = user.id
      redirect to '/tweets'
    end
  end

  
  get '/login' do
    if logged_in?
      redirect to '/tweets'
    else
      erb :"/users/login"
    
    end
  end
post '/login' do 
  #binding.pry
  @user =User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/tweets"
  else 
    redirect to '/login'
  end
end

get '/logout' do
  if logged_in?
    session.clear
    redirect to '/login'
  else
    redirect to '/'
  end
end

get "/users/:slug" do
  user= User.find_by(params[:slug])
 @tweets = Tweet.all(user_id: user.id)

end
 



end
