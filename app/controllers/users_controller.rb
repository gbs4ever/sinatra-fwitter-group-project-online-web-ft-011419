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
      redirect to '/signin'
    else
      user = User.new(params)
      user.save
     user.id = session[:id]
      redirect to '/tweets'
    end
  end

  
  get '/signin' do
    erb :"users/login"
  end


end
