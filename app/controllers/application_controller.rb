require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views' # we do this so that the default will be to look
    # at views in the same directory where ApplicationController is? and the same
    # directory where config.ru is
    set :sessions, true 
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true 
    register Sinatra::Flash
  end

  get "/" do
    @recipes = Recipe.all # get all of the recipes from the recipe model 
    @current_user = current_user
    erb :"/recipes/index.html" # take that information and render it in a view,
    # which responds by sending that info back to the browser
  end

  not_found do 
    flash[:error] = "Couldn't find that route!"
    redirect "/recipes"
  end

  private 

  def current_user 
    User.find_by_id(session[:id])
  end 

  def logged_in? 
    !!current_user 
  end
end
