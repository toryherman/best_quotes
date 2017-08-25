require "sqlite3"
require "rulers/sqlite_model"

class MyTable < Rulers::Model::SQLite; end

STDERR.puts MyTable.schema.inspect

# Create row
mt = MyTable.find(1)
puts "#{mt.id}"
puts "#{mt.posted}"
puts "#{mt.title}"
puts "#{mt.body}"
