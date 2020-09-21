class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    @recipes = Recipe.all # get all of the recipes from the recipe model 
    @current_user = current_user 
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
      flash[:error] = "Please fill out all fields"
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
      flash[:error] = "Please fill out all fields"
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
end