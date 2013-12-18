class GroceryListsController < ApplicationController
  before_filter :load_fridge, only: [:index, :show, :create, :destroy]
  before_filter :load_list, only: [:show, :destroy]

  def index
    @lists = GroceryList.where(fridge_id: current_fridge.id)
  end

  def show
    @item = Item.new
    @items = @list.items
    @items_categories = Item.categories(@items)
  end

  def create
    @list = GroceryList.new(params[:grocery_list])
    @list.fridge_id = current_fridge.id
    if @list.save
      flash[:add_grocery_list_notice] = "#{@list.title} successfully created!"
    else
      flash[:add_grocery_list_notice] = @list.errors.full_messages.join(', ')
    end
    redirect_to fridge_path(@fridge)
  end

  def destroy
    @list.destroy
    redirect_to fridge_path(@fridge)
  end

  def convert_recipe_to_list
    recipe = Recipe.find(params[:recipe_id])
    list = GroceryList.new
    list.fridge_id = current_fridge.id
    list.title = recipe.name
    if list.save
      list.add_ingredients(recipe, current_fridge, current_user)
      redirect_to fridge_grocery_list_path(current_fridge, list)
    else
      flash[:convert_recipe_notice] = "Something went wrong! Could not convert saved recipe."
      redirect_to recipe_query_recipe_path(recipe.recipe_query_id, recipe)
    end
  end


  private
  def load_fridge
    @fridge = current_fridge
  end

  def load_list
    @list = GroceryList.find(params[:id])
  end
end