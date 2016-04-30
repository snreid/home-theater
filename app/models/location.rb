class Location < ActiveRecord::Base
  has_many :dvds
  scope :ordered, -> { order(:shelf, :row, :stack) }

  def print
    "Shelf #{shelf}, Row #{row}, Stack #{stack}"
  end
end
