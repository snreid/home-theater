class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.integer :location_id
      t.integer :home_theater_info_id
      t.text :note

      t.timestamps null: false
    end
  end
end
