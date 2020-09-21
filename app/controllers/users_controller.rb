class UsersController < ApplicationController

    get '/users/new' do 
        erb :'/users/new'
    end 

    post '/users' do 
        @user = User.new(email: params[:email], password: params[:password]) # create new user 
        if @user.save # if able to save user 
            session[:id] = @user.id # assign session id to usr id, which logs them in 
            redirect "/" # direct user to homepage 
        else 
            flash[:error] = "Please fill out all fields"
            erb :'users/new' # if can't save user, redirect to sign up page
        end
    end
end

