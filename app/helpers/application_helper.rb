module ApplicationHelper
  def item_added_by(user_id)
    User.find(user_id).name
  end
end




