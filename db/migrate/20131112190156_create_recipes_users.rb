class CreateRecipesUsers < ActiveRecord::Migration
  def change
    create_table :recipes_users do |t|
      t.integer :recipe_id
      t.integer :user_id

      t.timestamps
    end
  end
end
