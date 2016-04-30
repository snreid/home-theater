class Location < ActiveRecord::Base
  has_many :dvds
  scope :ordered, -> { order(:shelf, :row, :stack) }
end
