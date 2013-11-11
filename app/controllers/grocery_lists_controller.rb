class GroceryListsController < ApplicationController
  def index
    @fridge = find_fridge(params[:fridge_id])
    @lists = GroceryList.where(fridge_id: params[:fridge_id])
  end

  def show
    @params = params
    # @list = GroceryList.find(fridge_id: params[:fridge_id])
  end

  def create
    @list = GroceryList.new
    @list.title = params[:grocery_list][:title]
    @list.fridge_id = params[:fridge_id].to_i
    @list.save
    redirect_to fridge_path(params[:fridge_id])
  end
end