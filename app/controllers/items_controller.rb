class ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
    @fridge = Fridge.find(params[:fridge_id])
  end

  def create
    new_item = Item.new(params[:item])
    new_item.fridge_id = params[:fridge_id]
    if new_item.save
      redirect_to fridge_path(new_item.fridge.id)
    else
      flash[:add_item_notice] = new_item.errors.full_messages.join(", ")
      redirect_to fridge_path(new_item.fridge.id)
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id]).destroy
    redirect_to fridge_path(item.fridge_id)
  end
end