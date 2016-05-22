class AddLocationIdIndexToDvd < ActiveRecord::Migration
  def change
    add_index :dvds, :location_id, name: 'location_id_ix'
  end
end
