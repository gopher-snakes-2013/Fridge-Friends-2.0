# remove line 2
include ApplicationHelper
class FridgesController < ApplicationController
  before_filter :authorize_and_load_fridge, only: [:show, :destroy, :add_user]
  def index
    @fridge = Fridge.new
    @fridges = current_user.fridges
    # unnecessary, use current_user in the view
    @current_user = current_user
  end

  def create
    @fridge = current_user.fridges.build params[:fridge]
    if @fridge.save
      redirect_to fridges_path
    else
      @fridges = current_user.fridges
      render :index
    end
  end

  def show
    @item = Item.new
    @items = @fridge.related_items
    @find_user_email = User.new
    @items_categories = @items.map(&:category).uniq
    @user = current_user # just use current_user in the view
    @friends = @fridge.friends_excluding(current_user)
    @list = GroceryList.new
    @lists = @fridge.grocery_lists
  end

  def destroy
    @fridge.destroy
    redirect_to fridges_path
  end

  # there is too much if/else logic
  def add_user
    searched_user = User.find_by_email(params[:user][:email])
    if searched_user
      # rename this to friends?
      unless fridge.owner?(searched_user)
        fridge.users << searched_user
        flash[:add_user_notice] = "User successfully added as a friend."
      else
        flash[:add_user_notice] = "User is already a friend of this fridge."
      end
    else
      flash[:add_user_notice] = "User not found. Please try again."
    end
    redirect_to fridge
  end

  def remove_user
    fridge = find_fridge(params[:id])
    # use before_filter
    if current_user.id != fridge.creator_id
      flash[:remove_user_from_fridge_notice] = "User successfully removed from #{fridge.name}"
      fridge.users.delete(current_user)
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
