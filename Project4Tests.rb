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
puts Pair.new(1, 2).null?
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
puts Pair.new(1, 2).list?
puts " = false"

##############################
# Pair.new, Pair.to_s, and cons
##############################

puts 16
puts Pair.new(1, 2).to_s
puts " = (1 . 2)"

puts 17
puts Pair.new("bla", "hi").to_s
puts ' = ("bla" . "hi")'

puts 18
puts Pair.new("bla", 5).to_s
puts ' = ("bla" . 5)'

puts 19
puts Pair.new(5, "bla").to_s
puts ' = (5 . "bla")'

puts 20
puts Pair.new("bla", Pair.new("hi", "you")).to_s
puts ' = ("bla" "hi" . "you")'

puts 21
puts cons(1, cons(2, cons(3, cons(4, Pair.null))))
puts " = (1 2 3 4)"

puts 22
puts cons(1, cons(cons(2, 3), cons(4, Pair.null)))
puts " = (1 (2 . 3) 4)"

puts 23
puts cons(1, cons(2, cons(cons(3, cons(cons(4, 5), Pair.null)), Pair.null)))
puts " = (1 2 (3 (4 . 5)))"

puts 24
puts cons(1, cons(2, cons(cons(3, cons(4, cons(5, Pair.null))), Pair.null)))
puts " = (1 2 (3 4 5))"

puts 25
puts cons(cons(1, 2), cons(cons(3, 4), 5))
puts " = ((1 . 2) (3 . 4) . 5)"

puts 26
puts cons(1, cons(2, cons(3, Pair.null)))
puts " = (1 2 3)"

puts 27
puts cons(1, cons(2, cons(3, 4)))
puts " = (1 2 3 . 4)"

puts 28
puts cons(1, cons(2, cons(cons(3, 4), cons(5, 6))))
puts " = (1 2 (3 . 4) 5 . 6)"

puts 29
puts cons(1, cons(cons(Pair.null, 2), cons(3, Pair.null)))
puts " = (1 (() . 2) 3)"

puts 30
puts cons(cons(cons(2, 3), cons(4, 5)), cons(6, 7))
puts " = (((2 . 3) 4 . 5) 6 . 7)"

puts 31
puts cons(1, cons(2, cons(3, cons(4, Pair.null))))
puts " = (1 2 3 4)"

puts 32
puts cons(1, cons(2, 3))
puts " = (1 2 . 3)"

puts 33
puts cons(1, cons(cons(2, cons(3, Pair.null)), cons(4, cons(5, Pair.null))))
puts " = (1 (2 3) 4 5)"

##############################
# Pair.car
##############################

puts 34
puts Pair.new(1, 2).car
puts " = 1"

puts 35
puts Pair.new("bla", 2).car
puts " = bla"

puts 36
puts Pair.new(Pair.new(1, 2), 3).car().to_s
puts " = (1 . 2)"

puts 37
puts Pair.new(nil, 4).car
puts " = "

##############################
# Pair.cdr
##############################

puts 34
puts Pair.new(1, 2).cdr
puts " = 2"

puts 35
puts Pair.new(2, "bla").cdr
puts " = bla"

puts 36
puts Pair.new(Pair.new(1, 2), 3).cdr().to_s
puts " = 3"

puts 37
puts Pair.new(4, nil).cdr
puts " = "

##############################
# Pair.list?
##############################

puts 38
puts Pair.new(1, Pair.null).list?
puts " = true"

puts 39
puts nil.list?
puts " = true"

puts 40
puts "bla".list?
puts " = false"

puts 41
puts Pair.new(1, 2).list?
puts " = false"
