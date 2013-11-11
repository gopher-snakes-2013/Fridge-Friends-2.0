class RecipeQueriesController < ApplicationController
  def index
    @recipe_query = RecipeQuery.new
    @recipe_array = []
  end

  def create
  end

  def show
  end

  def destroy
  end

end