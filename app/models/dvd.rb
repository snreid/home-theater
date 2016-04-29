class Dvd < ActiveRecord::Base
  belongs_to :location
  belongs_to :home_theater_info
end
