class GroceryListsController < ApplicationController
  before_filter :load_fridge, only: [:index, :show, :create]
  before_filter :load_list, only: [:show]

  def index
    @fridge
    @lists = GroceryList.where(fridge_id: @fridge.id)
  end

  def show
    @fridge
    @list
    @item = Item.new
    @items = @list.items
    @items_categories = Item.categories(@items)
  end

  def create
    @list = GroceryList.new(params[:grocery_list])
    @list.fridge_id = params[:fridge_id].to_i
    if @list.save
      flash[:add_grocery_list_notice] = "#{@list.title} successfully created!"
    else
      flash[:add_grocery_list_notice] = @list.errors.full_messages.join(', ')
    end
    redirect_to fridge_path(@fridge)
  end

  def destroy
    @list = GroceryList.find(params[:id])
    @list.destroy
    redirect_to fridge_path(params[:fridge_id])
  end

  private
  def load_fridge
    @fridge = Fridge.find(params[:fridge_id])
  end

  def load_list
    @list = GroceryList.find(params[:id])
  end
end