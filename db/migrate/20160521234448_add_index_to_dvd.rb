class AddIndexToDvd < ActiveRecord::Migration
  def change
    add_index :dvds, :home_theater_info_id, name: 'home_theater_info_id_ix'
  end
end
