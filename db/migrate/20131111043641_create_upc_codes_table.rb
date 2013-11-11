class CreateUpcCodesTable < ActiveRecord::Migration
  def up
    create_table :upc_codes do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :upc_codes
  end
end
