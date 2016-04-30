# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Adding default locations"
MAX_SHELVES = 4
MAX_ROWS = 5
MAX_STACKS = 3

MAX_SHELVES.times do |shelf|
  MAX_ROWS.times do |row|
    MAX_STACKS.times do |stack|
      Location.find_or_create_by(shelf: shelf+1, row: row+1, stack: stack+1)
    end
  end
end
