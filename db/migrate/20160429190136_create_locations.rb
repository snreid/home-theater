class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :shelf
      t.string :row
      t.string :stack

      t.timestamps null: false
    end
  end
end
