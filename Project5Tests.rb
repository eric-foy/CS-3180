##################################################
# empty?
##################################################

b = BST.new()
b.empty?
b.add(500)
b.empty?

##################################################
# collect_inorder
##################################################

b = BST.new()
b.add(24)
b.add(13)
b.add(10)
b.add(15)
b.add(28)
b.add(25)
b.add(33)

b.collect_inorder{ |x| x + 1 }

##################################################
# include?
##################################################

b = BST.new()
b.add(24)
b.add(13)
b.add(10)
b.add(15)
b.add(28)
b.add(25)
b.add(33)

b.include?(5)
b.include?(24)
b.include?(13)
b.include?(10)
b.include?(15)
b.include?(28)
b.include?(25)
b.include?(33)
b.include?(24)
b.add(24)
b.include?(24)


##################################################
# initialize and add
##################################################

b = BST.new{ |a, b| if (a > b) then -1 elsif (a > b) then 1 else 0 end }
b.add(24)
b.add(13)
b.add(10)
b.add(15)
b.add(28)
b.add(25)
b.add(33)
b.to_a

b = BST.new
b.add(33)
b.add(30)
b.add(28)
b.add(25)
b.add(15)
b

b = BST.new
b.add(15)
b.add(25)
b.add(28)
b.add(30)
b.add(33)
b

##################################################
# dup
##################################################

b = BST.new{ |a, b| if (a > b) then -1 elsif (a > b) then 1 else 0 end }
b.add(24)
b2 = b.dup
b2.add(13)
b2.add(10)
b2.add(15)
b2.add(28)
b2.add(25)
b2.add(33)
b2.to_a

b = BST.new
b.add(24)
b2 = b.dup
b2.add(13)
b2.add(10)
b2.add(15)
b2.add(28)
b2.add(25)
b2.add(33)
b2.to_a
