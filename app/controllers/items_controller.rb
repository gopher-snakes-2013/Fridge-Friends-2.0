require 'rubygems'
require 'twilio-ruby'
include ApplicationHelper

class ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
    @fridge = Fridge.find(params[:fridge_id])
  end

  def create
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    current_user_number = convert_phone_number(current_user.phone_number)
    current_user_array = [current_user]

    new_item = Item.new(params[:item])
    new_item.fridge_id = params[:fridge_id]
    current_fridge = Fridge.find(params[:fridge_id])
    fridge_friends = current_fridge.users - current_user_array

    if new_item.save
      @client.account.sms.messages.create(body: "you just created a new item in #{current_fridge.name} called #{new_item.name}", to: current_user_number, from: '14153602257')
      puts "Message sent to item creator: #{current_user.name}"
      fridge_friends.each do |friend|
        friend_phone = convert_phone_number(friend.phone_number)
        @client.account.sms.messages.create(body: "#{current_user.name} just created a new item in #{current_fridge.name} called #{new_item.name}", to: friend_phone, from: '14153602257')
        puts "Message sent to fridge friend: #{friend.name}"
      end
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