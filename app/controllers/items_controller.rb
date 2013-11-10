# require 'rubygems'
require 'twilio-ruby'

#figure out how to put this in an env file
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
    new_item = Item.new(params[:item])
    new_item.fridge_id = params[:fridge_id]
    if new_item.save
      message = @client.account.sms.messages.create(body: "you just created a new item called #{new_item.name}",
                                              to: '+13605844437',
                                              from: '!14153602257')
      puts message.sid
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