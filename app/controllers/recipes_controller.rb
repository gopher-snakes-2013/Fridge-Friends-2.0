class RecipesController < ApplicationController
  before_filter :load_recipe, only: [:show, :add_recipe_to_user, :destroy]
  before_filter :store_location, only: [:show]

  def index
    @recipe = Recipe.new
    @recipes = Recipe.all
    @recipe_query = RecipeQuery.find(params[:recipe_query_id])
  end

  def show
    @recipe
    @ingredients = @recipe.ingredients.split(',')
  end

  def add_recipe_to_user
    current_user.recipes << @recipe
    redirect_to recipe_query_recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to recipe_queries_path
  end

  private
  def load_recipe
    @recipe = Recipe.find(params[:id])
  end
end