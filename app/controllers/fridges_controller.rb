class FridgesController < ApplicationController
  before_filter :authorize_and_load_fridge, only: [:show]
  def index
    @fridge = Fridge.new
    @fridges = current_user.fridges
  end

  def create
    fridge = Fridge.new(params[:fridge])
    fridge.users << current_user
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
    @find_user_email = User.new
  end

  def destroy
    Fridge.find(params[:id]).destroy
    redirect_to :fridges
  end
  
  def add_user
    searched_user = User.find_by_email(params[:user][:email])
    fridge = Fridge.find(params[:id])
    if searched_user
      fridge.users << searched_user
      redirect_to fridge
    else
      flash[:notice] = "User not found. Please try again"
      redirect_to fridge
    end
  end

  private
  def authorize_and_load_fridge
    @fridge = Fridge.find(params[:id])
    redirect_to root_path unless @fridge.owner?(current_user)
  end
end
