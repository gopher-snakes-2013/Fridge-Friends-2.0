class Item < ActiveRecord::Base
  attr_accessible :name, :category, :fridge_id, :creator_id, :grocery_list_id
  belongs_to :fridge
  belongs_to :grocery_list
  belongs_to :creator, :class_name => "User"
  validates_presence_of :name, :category, :fridge_id, :creator_id

  def self.categories(items)
    items.map { |item| item.category }.uniq unless items.nil?
  end

  def add_to_fridge
    self.grocery_list = nil
    self.created_at = Time.now
    self.save
  end
end