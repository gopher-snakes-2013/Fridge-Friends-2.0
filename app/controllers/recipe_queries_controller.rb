class RecipeQueriesController < ApplicationController
  before_filter :load_recipe_query, only: [:show, :destroy]

  def index
    @recipe_query = RecipeQuery.new
    @recipe_queries = current_user.recipe_queries
  end

  def create
    recipe_query = RecipeQuery.new(params[:recipe_query])
    recipe_query.user_id = current_user.id
    if recipe_query.save
      result = Yummly.search(recipe_query.terms)
      RecipeQuery.create_recipes_from_search(recipe_query, result)
      redirect_to recipe_query_path(recipe_query)
    else
      flash[:add_recipe_query_notice] = recipe_query.errors.full_messages.join(", ")
      redirect_to recipe_queries_path
    end
  end

  def show
    @recipe_query
    @recipes = @recipe_query.recipes
  end

  def destroy
    if current_user.id == @recipe_query.user_id
      @recipe_query.destroy
    else
      flash[:delete_recipe_query_notice] = "You are not authorized to remove this recipe search"
    end
    redirect_to recipe_queries_path
  end

  private
  def load_recipe_query
    @recipe_query = RecipeQuery.find(params[:id])
  end
end