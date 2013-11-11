class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients, :recipe_query_id
  belongs_to :recipe_query
  validates :name, :ingredients, :recipe_query_id, presence: true
end