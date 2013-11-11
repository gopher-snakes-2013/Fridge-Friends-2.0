class GroceryList < ActiveRecord::Base
  belongs_to :fridge
  has_many :items
  validates_uniqueness_of :title, :scope => [:fridge_id]
  validates_presence_of :title
end