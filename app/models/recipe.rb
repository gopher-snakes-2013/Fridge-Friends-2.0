class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients, :recipe_query_id
  belongs_to :recipe_query
  has_and_belongs_to_many :users
  validates :name, :ingredients, :recipe_query_id, presence: true
end