class FridgesController < ApplicationController

  def index
    @fridge = Fridge.new
    @fridges = Fridge.all
  end

  def create
    fridge = Fridge.new(params[:fridge])
    if fridge.save
      redirect_to :fridges
    else
      redirect_to :fridges
    end
  end

  def show
    @fridge = Fridge.find(params[:id])
    @item = Item.new
    @items = @fridge.items.all
  end

  def destroy
    Fridge.find(params[:id]).destroy
    redirect_to :fridges
  end
end