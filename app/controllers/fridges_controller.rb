class FridgesController < ApplicationController
  before_filter :authorize_and_load_fridge, only: [:show, :destroy, :add_user, :remove_user]

  def index
    @fridge = Fridge.new
    @fridges = current_user.fridges
  end

  def create
    @fridge = Fridge.new(params[:fridge])
    @fridge.creator = current_user
    if @fridge.save
      @fridge.users << current_user
      redirect_to fridges_path
    else
      @fridges = current_user.fridges
      render :index
    end
  end

  def show
    @item = Item.new
    @find_user_email = User.new
    @list = GroceryList.new
    @lists = GroceryList.where(fridge_id: params[:id])
    @items = @fridge.fridge_items
    @items_categories = Item.categories(@items)
    @friends = @fridge.find_friends(current_user)
  end

  def destroy
    if @fridge.creator?(current_user)
      @fridge.destroy
      redirect_to :fridges
    else
      render :show
    end
  end

  def add_user
    new_friend = User.find_by_email(params[:user][:email])
    if new_friend && !@fridge.users.include?(new_friend)
      @fridge.add_friend(new_friend)
      flash[:add_user_notice] = "User successfully added as a friend."
    elsif new_friend && @fridge.users.include?(new_friend)
      flash[:add_user_notice] = "User is already a friend of this fridge."
    else
      flash[:add_user_notice] = "User not found. Please try again."
    end
    redirect_to :fridge
  end

  def remove_user
    if current_user != @fridge.creator
      flash[:remove_user_from_fridge_notice] = "User successfully removed from #{@fridge.name}"
      @fridge.users.delete(current_user)
    else
      flash[:remove_user_from_fridge_notice] = "User removal failed"
    end
    redirect_to fridges_path
  end

  private
  def authorize_and_load_fridge
    @fridge = Fridge.find(params[:id])
    redirect_to root_path unless @fridge.owner?(current_user)
  end
end
