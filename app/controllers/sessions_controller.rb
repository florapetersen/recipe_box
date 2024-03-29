class SessionsController < ApplicationController 
    get '/login' do 
        erb :'/sessions/login'
    end 

    post '/login' do 
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:id] = user.id 
            redirect "/" 
        else
            flash[:error] = "Incorrect email or password" 
            erb :'/sessions/login' 
        end
    end

    delete '/logout' do 
        session.clear 
        redirect "/"
    end
end