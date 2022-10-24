class Pair
  def initialize(value1, value2)
    @value1 = value1
    @value2 = value2
  end

  def self.null
    return Pair.new(nil, nil)
  end

  def car
    return @value1
  end

  def cdr
    return @value2
  end

  def null?
    return (@value1 == nil && @value2 == nil)
  end

  def count
    if (!list?)
      return false
    end

    c = 1
    v = @value2
    while (!v.null?)
      c = c + 1
      v = v.cdr
    end

    return c
  end

  def list?
    if (null?)
      return true
    end

    if (@value2.class == Pair)
      return @value2.list?
    else
      return false
    end
  end

  def to_s
    #TODO test if value is a pair
    "(#{@value1} . #{@value2})"
  end
end

class NilList < Pair
  def initialize
    super(nil, nil)
  end
end

def cons(value1, value2)
  Pair.new(value1, value2)
end
