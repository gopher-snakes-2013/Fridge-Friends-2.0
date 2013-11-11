class RecipeQueriesController < ApplicationController
  def index
    @recipe_query = RecipeQuery.new
    @recipe_queries = current_user.recipe_queries
    @current_user = current_user
  end

  def create
    recipe_query = RecipeQuery.new(params[:recipe_query])
    recipe_query.user_id = current_user.id
    result = Yummly.search(recipe_query.terms)
    recipe_query.save

    result.collect.each do |recipe|
      new_recipe = Recipe.new
      new_recipe.name = recipe.name
      new_recipe.ingredients = recipe.ingredients.join(", ")
      new_recipe.recipe_query_id = recipe_query.id
      new_recipe.save
      p "RECIPE:" + new_recipe.name
      p "INGREDIENTS:" + new_recipe.ingredients
    end
    redirect_to :recipe_queries
  end

  def show
    @recipe_query = RecipeQuery.find(params[:id])
    @recipes = @recipe_query.recipes
  end

  def destroy
  end

end