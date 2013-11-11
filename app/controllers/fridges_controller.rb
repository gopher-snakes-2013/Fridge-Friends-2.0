require 'rubygems'
require 'twilio-ruby'
include ApplicationHelper

class FridgesController < ApplicationController
  before_filter :authorize_and_load_fridge, only: [:show]
  def index
    @fridge = Fridge.new
    @fridges = current_user.fridges
    @current_user = current_user
  end

  def create
    fridge = Fridge.new(params[:fridge])
    fridge.users << current_user
    fridge.creator_id = current_user.id
    if fridge.save
      redirect_to :fridges
    else
      flash[:add_fridge_notice] = fridge.errors.full_messages.join(", ")
      redirect_to :fridges
    end
  end

  def show
    @fridge = Fridge.find(params[:id])
    @item = Item.new
    @items = @fridge.items.all
    @find_user_email = User.new
    categories = []
    @items.each { |i| categories << i.category }
    @items_categories = categories.uniq.sort
    @user = current_user
    @friends = find_only_friends_of_fridge(current_user, @fridge)
    @upc = UpcCode.new
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

  private
  def authorize_and_load_fridge
    @fridge = Fridge.find(params[:id])
    redirect_to root_path unless @fridge.owner?(current_user)
  end
end
