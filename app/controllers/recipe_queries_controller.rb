class RecipeQueriesController < ApplicationController
  def index
    @recipe_query = RecipeQuery.new
    @recipe_queries = current_user.recipe_queries
    @current_user = current_user
  end

  def create
    recipe_query = RecipeQuery.new(params[:recipe_query])
    recipe_query.user_id = current_user.id
    if recipe_query.save
      result = Yummly.search(recipe_query.terms)
      extract_recipes_from_search(recipe_query, result)
      redirect_to recipe_query_path(recipe_query.id)
    else
      redirect_to recipe_queries_path
    end
  end

  def show
    @recipe_query = RecipeQuery.find(params[:id])
    @recipes = @recipe_query.recipes
  end

  def destroy
    recipe_query = RecipeQuery.find(params[:id])
    if current_user.id == recipe_query.user_id
      recipe_query.destroy
    else
      flash[:delete_recipe_query_notice] = "You are not authorized to remove this recipe search"
    end
    redirect_to recipe_queries_path
  end

end