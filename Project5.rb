# Eric Foy

class Node
  attr_accessor :value, :left, :right

  def initialize(v, l=nil, r=nil)
    @value = v
    @left = l
    @right = r
  end
end

class BST
  def initialize(&compare_method)
    @head = nil

    if (block_given?)
      @compare_method = compare_method
    else
      @compare_method = proc { |a, b| a <=> b }
    end
  end

  def add(item)
    if (@head == nil)
      @head = item
      return self
    end
  end

  def empty?
    return (@head == nil)
  end

  def test
    puts @compare_method.call(8, 5)
    puts @compare_method.call(5, 5)
    puts @compare_method.call(5, 8)
  end
end
