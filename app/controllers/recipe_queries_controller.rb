class RecipeQueriesController < ApplicationController
  def index
    @recipe_query = RecipeQuery.new
    @recipe_queries = current_user.recipe_queries
    @current_user = current_user
  end

  def create
    recipe_query = RecipeQuery.new(params[:recipe_query])
    recipe_query.user_id = current_user.id
    recipe_query.save
    result = Yummly.search(recipe_query.terms)
    extract_recipes_from_search(recipe_query, result)
    redirect_to recipe_query_path(recipe_query.id)
  end

  def show
    @recipe_query = RecipeQuery.find(params[:id])
    @recipes = @recipe_query.recipes
  end

  def destroy
  end

end