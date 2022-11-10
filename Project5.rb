# Eric Foy

# Node holds the left, right, and value of an item in the BST. All instance
# variables are public.
class Node
  attr_accessor :value, :left, :right

  # Left and right have default values of nil.
  # Parameters:
  # v - value of item
  # l - node left from self
  # r - node right from self
  def initialize(v, l=nil, r=nil)
    @value = v
    @left = l
    @right = r
  end
end

# A traditional binary search tree.
class BST
  # Return a new, empty BST. If a block of code is provided, this code is used
  # to compare two objects in the tree during insertion, search, etc.  This
  # block should accept two parameters and return 1, -1, or 0, like Ruby’s <=>
  # operator. If no block is provided, the <=> operator is used for comparison.
  # Parameters:
  # compare_method - the block of code used for insertion, search, etc
  def initialize(&compare_method)
    @head = nil

    if (block_given?)
      @compare_method = compare_method
    else
      @compare_method = Proc.new { |a, b| a <=> b }
    end
  end

  # Add a new item to the binary tree. Add must maintain a valid binary search
  # tree structure as new data is added to the tree. Duplicate items should be
  # stored in the right subtree.
  # Parameters:
  # item - value of the node to be added. method will create the node
  # Returns: nil
  def add(item)
    if (empty?)
      @head = Node.new(item)
      return nil
    else
      n = @head
      while (true)
        if (@compare_method.call(item, n.value) >= 0)
          if (n.right == nil)
            n.right = Node.new(item)
            return nil
          else
            n = n.right
          end
        else
          if (n.left == nil)
            n.left = Node.new(item)
            return nil
          else
            n = n.left
          end
        end
      end
    end
  end

  # Returns true if the tree is empty. Otherwise returns false.
  # Parameters: None
  # Returns: true if head is nil
  def empty?
    return (@head == nil)
  end

  # Returns true if the item is found in the tree, otherwise returns false.
  # When the tree is balanced, search should take no more than O(log2 n) time.
  # Parameters:
  # item - value to search for in the tree
  # Returns: true if item is found
  def include?(item)
    if (empty?)
      return false
    end

    n = @head
    while (n != nil)
      case @compare_method.call(item, n.value)
      when 0
        return true
      when -1
        n = n.left
      when 1
        n = n.right
      else
        puts("Error: compare method returns not in [-1, 0, 1]")
      end
    end

    return false
  end

  # Returns the number of items in the tree.
  # Parameters: None
  # Returns: number of items in the tree
  def size
    s = []
    n = @head
    c = 0
    while (true)
      while (n != nil)
        s.push(n)
        n = n.left
      end
      n = s.pop
      if (n == nil)
        break
      end
      c = c + 1
      n = n.right
    end

    return c
  end

  # Performs an in-order traversal of the tree, passing each item found to
  # block.
  # Parameters:
  # proc - each item in BST is passed inorder to this block
  # Returns: nil
  def each_inorder
    s = []
    n = @head
    while (true)
      while (n != nil)
        s.push(n)
        n = n.left
      end
      n = s.pop
      if (n == nil)
        break
      end
      yield n.value
      n = n.right
    end

    return nil
  end

  # Performs an in-order traversal of the tree, passing each item found to
  # block. The values returned by block are collected into a new BST, which is
  # returned by collect_inorder.
  # Parameters:
  # proc - block that is performed on each item in BST
  # Returns: new BST that had proc applied to all items
  def collect_inorder
    s = []
    c = []
    n = @head
    while (true)
      while (n != nil)
        c.push(yield n.value)
        s.push(n)
        n = n.left
      end
      n = s.pop
      if (n == nil)
        break
      end
      n = n.right
    end

    b = BST.new(&@compare_method)
    c.each{ |x| b.add(x) }
    return b
  end

  # Returns a sorted array of all the elements in the BST.
  # Parameters: None
  # Returns: sorted array of all items
  def to_a
    s = []
    c = []
    n = @head
    while (true)
      while (n != nil)
        s.push(n)
        n = n.left
      end
      n = s.pop
      if (n == nil)
        break
      end
      c.push(n.value)
      n = n.right
    end

    return c
  end

  # Returns a new binary search tree with the same contents as the original
  # tree. This operation should perform a deep copy of the original tree.
  # Parameters: None
  # Returns: deep copy of BST
  def dup
    s = []
    c = []
    n = @head
    while (true)
      while (n != nil)
        c.push(n.value)
        s.push(n)
        n = n.left
      end
      n = s.pop
      if (n == nil)
        break
      end
      n = n.right
    end

    b = BST.new(&@compare_method)
    c.each{ |x| b.add(x) }
    return b
  end
end
