class GroceryListsController < ApplicationController
  def index
    @fridge = find_fridge(params[:fridge_id])
    @lists = GroceryList.where(fridge_id: params[:fridge_id])
  end

  def show
    @fridge = Fridge.find(params[:fridge_id])
    @list = GroceryList.find(params[:id])
    @item = Item.new
    @items = @list.items
    categories = []
    @items.each { |i| categories << i.category }
    @items_categories = categories.uniq.sort
  end

  def create
    @list = GroceryList.new
    @list.title = params[:grocery_list][:title]
    @list.fridge_id = params[:fridge_id].to_i
    if @list.save
      flash[:add_grocery_list_notice] = "#{@list.title} successfully created!"
    else
      flash[:add_grocery_list_notice] = @list.errors.full_messages.join(', ')
    end
    redirect_to fridge_path(params[:fridge_id])
  end

  def destroy
    @list = GroceryList.find(params[:id])
    @list.destroy
    redirect_to fridge_path(params[:fridge_id])
  end
end