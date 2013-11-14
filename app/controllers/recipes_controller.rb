include ApplicationHelper

class RecipesController < ApplicationController
  def index
    @recipe = Recipe.new
    @recipes = Recipe.all
    @recipe_query = RecipeQuery.find(params[:recipe_query_id])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.split(',')
  end

  def add_recipe_to_user
    @recipe = Recipe.find(params[:id])
    user = User.find(current_user.id)
    user.recipes << @recipe
    redirect_to recipe_query_recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipe_queries_path
  end
end