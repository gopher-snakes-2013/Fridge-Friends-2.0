class Item < ActiveRecord::Base
  attr_accessible :name, :category, :fridge_id, :creator_id, :grocery_list_id
  validates_presence_of :name, :category, :fridge_id, :creator_id
  validates_uniqueness_of :name, :scope => [:grocery_list_id]
  belongs_to :fridge
  belongs_to :grocery_list

  def self.categories(items)
    items.map { |item| item.category } unless items.nil?
  end

end