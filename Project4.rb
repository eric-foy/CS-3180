# nil for our purposes is an empty list

class Object
  def pair?
    return (self.class == Pair)
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

  def car
    return @value1
  end

  def cdr
    return @value2
  end

  def to_s
    o = ""
    v = self
    while (v.pair? && v.cdr.pair?)
      o = "#{o} #{v.car}"
      v = v.cdr
    end

    o = "#{o} #{v.car}"
    if (v.cdr.null?)
      return "(#{o.lstrip})"
    else
      return "(#{o.lstrip} . #{v.cdr})"
    end
  end
  
  def list?
    if (null?)
      return true
    end

    if (@value2.pair? || @value2.null?)
      return @value2.list?
    else
      return false
    end
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

  def append(other)
    if (!list?)
      return false
    end

    o = [car]
    v = @value2
    while (!v.cdr.null?)
      o = o + [v.car]
      v = v.cdr
    end
    o = o.reverse

    p = Pair.new(v.car, other)
    for i in o
      p = Pair.new(i, p)
    end

    return p
  end

  def null?
    return (self == nil)
  end

  def self.null
    return nil
  end
end

def cons(value1, value2)
  Pair.new(value1, value2)
end
