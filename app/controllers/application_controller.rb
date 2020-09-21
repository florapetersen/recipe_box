require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views' # we do this so that the default will be to look at views in the same directory where 
    # ApplicationController and config.ru are
    set :sessions, true # enables sessions 
    set :session_secret, ENV["SESSION_SECRET"] # session_secret set to ENV["SESSION_SECRET"]
    set :method_override, true # so we're able to send a delete request for "/logout"
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

  def current_user # returns the instance of the logged in user, based on the session[:user_id]
    User.find_by_id(session[:id])
  end 

  def logged_in? # returns true or false based on presence of a session[:user_id]
    !!current_user 
  end

  def set_recipe 
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe.nil?
      flash[:error] = "Couldn't find a Recipe with id: #{params[:id]}"
      redirect "/recipes"
    end 
  end

  def redirect_if_not_authorized 
    redirect_if_not_logged_in
    if !authorize_recipe(@recipe)
      flash[:error] = "You don't have permission to do that!"
      redirect "/recipes"
    end 
  end

  def authorize_recipe(recipe)
    current_user == recipe.author 
  end

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to view that page"
      redirect request.referrer || "/login" # ???
    end
  end
end
