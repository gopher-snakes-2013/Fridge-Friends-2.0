module ApplicationHelper
  def convert_phone_number(number)
    number = "1#{number.gsub(/-/, '')}"
  end
end
