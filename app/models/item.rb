class Item < ActiveRecord::Base
  attr_accessible :name, :category, :fridge_id, :creator_id, :grocery_list_id
  validates_presence_of :name, :category, :fridge_id, :creator_id
  validates_uniqueness_of :name, :scope => [:grocery_list_id]
  belongs_to :fridge
  belongs_to :grocery_list

  def no_grocery_list?
    self.grocery_list.blank?
  end
end
