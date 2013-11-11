class Item < ActiveRecord::Base
  attr_accessible :name, :category, :fridge_id, :creator_id
  
  validates_presence_of :name, :category, :fridge_id, :creator_id

  belongs_to :fridge
end