class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.belongs_to :recipe_query

      t.timestamps
    end
  end
end
