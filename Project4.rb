# nil for our purposes is an empty list

class Object
  def pair?
    if (self.class == Pair)
      true
    else
      false
    end
  end

  def null?
    return (self == nil)
  end

  def list?
    return (self == nil)
  end
end

class Pair
  def initialize(value1, value2)
    @value1 = value1
    @value2 = value2
  end

  def self.null
    return nil
  end

  def car
    return @value1
  end

  def cdr
    return @value2
  end

  def null?
    return (self == nil)
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

    if (@value2.class == Pair || @value2 == nil)
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

def cons(value1, value2)
  Pair.new(value1, value2)
end
