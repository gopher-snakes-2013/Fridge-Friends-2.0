class Item < ActiveRecord::Base
  validates_presence_of :name, :category, :fridge_id

  belongs_to :fridge
end