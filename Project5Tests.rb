b = BST.new()
b.add(24)
b.add(13)
b.add(10)
b.add(15)
b.add(28)
b.add(25)
b.add(33)


b = BST.new{ |a, b| if (a > b) then -1 elsif (a > b) then 1 else 0 end }
b.add(24)
b.add(13)
b.add(10)
b.add(15)
b.add(28)
b.add(25)
b.add(33)
