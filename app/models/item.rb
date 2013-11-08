class Item < ActiveRecord::Base
  attr_accessible :name, :category, :fridge_id
  
  validates_presence_of :name, :category, :fridge_id

  belongs_to :fridge
end