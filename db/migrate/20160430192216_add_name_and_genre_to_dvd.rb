class AddNameAndGenreToDvd < ActiveRecord::Migration
  def change
    add_column :dvds, :title, :string
    add_column :dvds, :genre, :string
  end
end
