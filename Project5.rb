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
      @compare_method = Proc.new { |a, b| a <=> b }
    end
  end

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

  def empty?
    return (@head == nil)
  end

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
  end

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
