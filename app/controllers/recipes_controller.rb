class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    @recipes = Recipe.all # get all of the recipes from the recipe model 
    erb :"/recipes/index.html" # render all the recipes in a view,
    # which responds by sending that info back to the browser 
  end

  # GET: /recipes/new --> new 
  get "/recipes/new" do
    redirect_if_not_logged_in
    @recipe = Recipe.new 
    erb :"/recipes/new.html"
  end

  # POST: /recipes -> create
  post "/recipes" do
    @recipe = current_user.recipes.build(title: params[:recipe][:title],content:params[:recipe][:content], tag_ids: params[:recipe][:tag_ids])
    if @recipe.save 
      redirect "/recipes"
    else
      erb :"/recipes/new.html"
    end
  end

  # GET: /recipes/5 --> show 
  get "/recipes/:id" do
    set_recipe
    erb :"/recipes/show.html"
  end

  # GET: /recipes/5/edit --> edit
  get "/recipes/:id/edit" do
    set_recipe
    redirect_if_not_authorized 
    erb :"/recipes/edit.html"
  end

  # PATCH: /recipes/5 --> update
  patch "/recipes/:id" do
    set_recipe
    if @recipe.update(title: params[:recipe][:title], content:params[:recipe][:content], tag_ids: params[:recipe][:tag_ids])
      flash[:success] = "Recipe updated"
      redirect "/recipes/#{@recipe.id}"
    else
      erb :"/recipes/edit.html"
    end
  end

  # DELETE: /recipes/5 --> destroy
  delete "/recipes/:id" do
    set_recipe
    redirect_if_not_authorized 
    @recipe.destroy
    redirect "/recipes"
  end

  private 

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
end
