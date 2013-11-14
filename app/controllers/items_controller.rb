include ApplicationHelper
require 'Twilio'
include Twilio

class ItemsController < ApplicationController
  # before_filter :load_item, only: []
  before_filter :load_fridge, only: [:index, :create, :create_grocery_list_item]
  before_filter :load_list, only: [:create_grocery_list_item]

  def index
    @item = Item.new
    @items = Item.all
  end

  def create
    @new_item = Item.new(params[:item])
    @new_item.creator = current_user
    @new_item.fridge_id = @fridge.id
    fridge_friends = @fridge.find_friends(current_user)
    if @new_item.save
      Twilio.text_current_user(@fridge, @new_item, current_user)
      Twilio.text_fridge_friends(fridge_friends, @fridge, @new_item, current_user)
    else
      flash[:add_item_notice] = @new_item.errors.full_messages.join(", ")
    end
    redirect_to fridge_path(@fridge)
  end

  def create_grocery_list_item
    @new_item = Item.new(params[:item])
    @new_item.grocery_list_id = params[:grocery_list_id]
    @new_item.fridge_id = @fridge.id
    @new_item.creator = current_user
    if @new_item.save
      flash[:add_item_notice] = 'Item successfully added to Grocery List.'
    else
      flash[:add_item_notice] = @new_item.errors.full_messages.join(", ")
    end
    redirect_to fridge_grocery_list_path(@fridge.id, @list.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id]).destroy
    redirect_to fridge_path(item.fridge_id)
  end

  def destroy_grocery_list_item
    item = Item.find(params[:id]).destroy
    fridge = Fridge.find(params[:fridge_id])
    list = GroceryList.find(params[:grocery_list_id])
    redirect_to fridge_grocery_list_path(fridge, list)
  end

  private
  def load_item
    @item = Item.find(params[:id])
  end

  def load_fridge
    @fridge = Fridge.find(params[:fridge_id])
  end

  def load_list
    @list = GroceryList.find(params[:grocery_list_id])
  end
end