require 'rubygems'
require 'twilio-ruby'
module Twilio

  def convert(phone_number)
    number = "1#{phone_number.gsub(/-/, '')}"
  end

  extend self

  def client
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def text_current_user(fridge, item, current_user)
    if current_user.opted_in && current_user.phone_number
      self.client.account.sms.messages.create(body: "you just added #{item.name} to your #{fridge.name} fridge", to: self.convert(current_user.phone_number), from: '14153602257')
      puts "Message sent to item creator: #{current_user.name}"
    else
      puts "#{current_user.name} not opted in for text alerts"
    end
  end

  def text_fridge_friends(friends, fridge, item, current_user)
    friends.each do |friend|
      if friend.opted_in && friend.phone_number
        phone_number = self.convert(friend.phone_number)
        self.client.account.sms.messages.create(body: "#{current_user.name} just added #{item.name} to #{fridge.name} fridge", to: convert(friend.phone_number), from: '14153602257')
        puts "Message sent to fridge friend: #{friend.name}"
      else
        puts "#{friend.name} not opted in for text alerts"
      end
    end
  end

end