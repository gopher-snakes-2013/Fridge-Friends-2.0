module ApplicationHelper
  def convert(phone_number)
    number = "1#{phone_number.gsub(/-/, '')}"
  end

  # def twilio_client
  #   account_sid = ENV['ACCOUNT_SID']
  #   auth_token = ENV['AUTH_TOKEN']
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  # end

  def find_fridge(id)
    Fridge.find(id)
  end

  def find_list(id)
    GroceryList.find(id)
  end

  # def find_only_friends_of_fridge(current_user, current_fridge)
  #   current_user_array = [current_user]
  #   current_fridge.users - current_user_array
  # end

  # def text_current_user(twilio_client, current_user, fridge, item)
  #   if current_user.opted_in && current_user.phone_number
  #     twilio_client.account.sms.messages.create(body: "you just added #{item.name} to your #{fridge.name} fridge", to: convert(current_user.phone_number), from: '14153602257')
  #     puts "Message sent to item creator: #{current_user.name}"
  #   else
  #     puts "#{current_user.name} not opted in for text alerts"
  #   end
  # end

  # def text_fridge_friends(twilio_client, friends, original_user, fridge, item)
  #   friends.each do |friend|
  #     if friend.opted_in && friend.phone_number
  #       phone_number = convert(friend.phone_number)
  #       twilio_client.account.sms.messages.create(body: "#{original_user.name} just added #{item.name} to #{fridge.name} fridge", to: convert(friend.phone_number), from: '14153602257')
  #       puts "Message sent to fridge friend: #{friend.name}"
  #     else
  #       puts "#{friend.name} not opted in for text alerts"
  #     end
  #   end
  # end

  def extract_recipes_from_search(recipe_query, result)
    result.each do |recipe|
      new_recipe = Recipe.new
      new_recipe.name = recipe.name
      new_recipe.img_url = recipe.images.first.small_url
      new_recipe.ingredients = recipe.ingredients.join(", ")
      new_recipe.recipe_query_id = recipe_query.id
      new_recipe.save
    end
  end

  def item_added_by(user_id)
    User.find(user_id).name
  end

  # def is_shared?
  #   Fridge.find(self.id).users.length >= 2
  # end
end




