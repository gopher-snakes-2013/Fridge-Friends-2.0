class RecipeQuery < ActiveRecord::Base
  attr_accessible :terms, :user_id
  has_many :recipes
end