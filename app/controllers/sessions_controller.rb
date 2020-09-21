class SessionsController < ApplicationController 
    get '/login' do 
        erb :'/sessions/login'
    end 

    post '/login' do 
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:id] = user.id # setting the user's id to the session id "logs in" the user
            redirect "/" # redirect sends a new get request; back to "homepage" from app controller
        else
            flash[:error] = "Incorrect email or password" 
            erb :'/sessions/login' # if can't find user and/or can't authenticate user, displays
            # error message and directs back to login page
        end
    end

    delete '/logout' do 
        session.clear 
        redirect "/"
    end
end