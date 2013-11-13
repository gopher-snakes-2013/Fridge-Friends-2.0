class FridgesController < ApplicationController
  before_filter :authorize_and_load_fridge, only: [:show]

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
    items_related_to_fridge = @fridge.items.all
    @items = []
    items_related_to_fridge.each do |item|
      unless item.grocery_list_id
        @items << item
      end
    end
    @find_user_email = User.new
    categories = []
    @items.each { |i| categories << i.category }
    @items_categories = categories.uniq.sort
    @user = current_user
    @friends = find_only_friends_of_fridge(current_user, @fridge)
    @list = GroceryList.new
    @fridge = find_fridge(params[:id])
    @lists = GroceryList.where(fridge_id: params[:id])
  end

  def destroy
    fridge = Fridge.find(params[:id])
    if current_user.id == fridge.creator_id
      fridge.destroy
    else
      flash[:delete_fridge_notice] = "You are not authorized to remove this fridge"
    end
    redirect_to :fridges
  end

  def add_user
    searched_user = User.find_by_email(params[:user][:email])
    fridge = Fridge.find(params[:id])
    if searched_user
      unless fridge.users.include?(searched_user)
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
