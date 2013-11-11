class GroceryList < ActiveRecord::Base
  belongs_to :fridge
  has_many :items
end