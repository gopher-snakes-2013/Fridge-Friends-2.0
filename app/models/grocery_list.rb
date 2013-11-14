class GroceryList < ActiveRecord::Base
  attr_accessible :fridge_id, :title
  belongs_to :fridge
  has_many :items
  validates_uniqueness_of :title, :scope => [:fridge_id]
  validates_presence_of :title

  def add_ingredients(recipe, fridge, user)
    ingredients = recipe.ingredients.split(",")
    ingredients.each do |ingredient|
      Item.create(name: ingredient, category: recipe.name, fridge_id: fridge.id, creator_id: user.id, grocery_list_id: self.id)
    end
  end
end