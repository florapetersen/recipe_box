class RecipeTagsController < ApplicationController

  # GET: /recipe_tags
  get "/recipe_tags" do
    erb :"/recipe_tags/index.html"
  end

  # GET: /recipe_tags/new
  get "/recipe_tags/new" do
    erb :"/recipe_tags/new.html"
  end

  # POST: /recipe_tags
  post "/recipe_tags" do
    redirect "/recipe_tags"
  end

  # GET: /recipe_tags/5
  get "/recipe_tags/:id" do
    erb :"/recipe_tags/show.html"
  end

  # GET: /recipe_tags/5/edit
  get "/recipe_tags/:id/edit" do
    erb :"/recipe_tags/edit.html"
  end

  # PATCH: /recipe_tags/5
  patch "/recipe_tags/:id" do
    redirect "/recipe_tags/:id"
  end

  # DELETE: /recipe_tags/5/delete
  delete "/recipe_tags/:id/delete" do
    redirect "/recipe_tags"
  end
end
