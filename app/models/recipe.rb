class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients, :recipe_query_id
  belongs_to :recipe_query
  has_and_belongs_to_many :users
  validates :name, :ingredients, :recipe_query_id, presence: true

  def self.create_from_ymmly(query, results)
    results.each do |recipe|
      self.create :name => recipe.name, :ingredients => recipe.ingredients.join(", "), :img_url => recipe.images.first.small_url, :recipe_query_id => query.id
    end
  end
end
