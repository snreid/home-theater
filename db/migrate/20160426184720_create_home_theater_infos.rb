class CreateHomeTheaterInfos < ActiveRecord::Migration
  def change
    create_table :home_theater_infos do |t|

      t.text :dvd_title
      t.string :studio
      t.string :released
      t.string :status
      t.string :sound
      t.string :versions
      t.string :price
      t.string :rating
      t.string :year
      t.string :genre
      t.string :aspect
      t.string :upc
      t.datetime :dvd_releasedate
      t.string :home_theater_info_id
      t.datetime :timestamp
    end
  end
end
