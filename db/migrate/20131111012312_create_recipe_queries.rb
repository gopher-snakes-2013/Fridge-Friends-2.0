class CreateRecipeQueries < ActiveRecord::Migration
  def change
    create_table :recipe_queries do |t|
      t.string :terms
      t.belongs_to :user

      t.timestamps
    end
  end
end
