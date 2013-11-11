class GroceryListsController < ApplicationController

  def create
    @list = GroceryList.new
    @list.title = params[:grocery_list][:title]
    @list.fridge_id = params[:fridge_id].to_i
    @list.save
    redirect_to fridge_path(params[:fridge_id])
  end
end