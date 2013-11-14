class RecipeQuery < ActiveRecord::Base
  attr_accessible :terms, :user_id
  has_many :recipes
  belongs_to :user
  validates :terms, presence: true
  validates_uniqueness_of :terms, :scope => :user_id

  def self.create_recipes_from_search(recipe_query, result)
    result.each do |recipe|
      new_recipe = Recipe.new
      new_recipe.name = recipe.name
      new_recipe.img_url = recipe.images.first.small_url
      new_recipe.ingredients = recipe.ingredients.join(", ")
      new_recipe.recipe_query_id = recipe_query.id
      new_recipe.save
    end
  end
end