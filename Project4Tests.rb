require "./Project4.rb"

##############################
# Object.pair?
##############################

puts 1
puts nil.pair?
puts " = false"

puts 2
puts Object.new().pair?
puts " = false"

puts 3
puts 3.pair?
puts " = false"

puts 4
puts "bla".pair?
puts " = false"

puts 5
puts Pair.new(1, 2).pair?
puts " = true"

##############################
# Object.null?
##############################

puts 6
puts nil.null?
puts " = true"

puts 7
puts Object.new().null?
puts " = false"

puts 8
puts 0.null?
puts " = false"

puts 9
puts "".null?
puts " = false"

puts 10
puts Pair.new().null?
puts " = false"

##############################
# Object.list?
##############################

puts 11
puts nil.list?
puts " = true"

puts 12
puts Object.new().list?
puts " = false"

puts 13
puts 0.list?
puts " = false"

puts 14
puts "".list?
puts " = false"

puts 15
puts Pair.new().list?
puts " = false"
