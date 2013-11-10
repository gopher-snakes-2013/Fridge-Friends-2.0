module ApplicationHelper
  def convert(phone_number)
    number = "1#{phone_number.gsub(/-/, '')}"
  end

  def twilio_client
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def find_fridge(id)
    Fridge.find(id)
  end

  def find_only_friends_of_fridge(current_user, current_fridge)
    current_user_array = [current_user]
    current_fridge.users - current_user_array
  end

  def text_current_user(twilio_client, current_user, fridge, item)
    if current_user.opted_in
      twilio_client.account.sms.messages.create(body: "you just created a new item in #{fridge.name} called #{item.name}", to: convert(current_user.phone_number), from: '14153602257')
      puts "Message sent to item creator: #{current_user.name}"
    else
      puts "#{current_user.name} not opted in for text alerts"
    end
  end

  def text_fridge_friends(twilio_client, friends, original_user, fridge, item)
    friends.each do |friend|
      if friend.opted_in
        phone_number = convert(friend.phone_number)
        twilio_client.account.sms.messages.create(body: "#{original_user.name} just created a new item in #{fridge.name} called #{item.name}", to: convert(friend.phone_number), from: '14153602257')
        puts "Message sent to fridge friend: #{friend.name}"
      else
        puts "#{friend.name} not opted in for text alerts"
      end
    end
  end
end




