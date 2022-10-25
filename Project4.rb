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

    if (@value2.pair? || @value2.null?)
      return @value2.list?
    else
      return false
    end
  end

  def to_s
    o = ""
    v = self
    while (v.pair? && v.cdr.pair?)
      o = "#{o} #{v.car}"
      v = v.cdr
    end

    if (v.cdr.null?)
      return "(#{o.lstrip} #{v.car})"
    else
      return "(#{o.lstrip} #{v.car} . #{v.cdr})"
    end
  end

=begin
  def to_s
    if (!list?)
      return "(#{@value1} . #{@value2})"
    end

    o = ""
    v = self
    while (v.list? && !v.null?)
      o = "#{o} #{v.car}"
      v = v.cdr
    end

    return "(#{o.lstrip})"
  end
=end
end

def cons(value1, value2)
  Pair.new(value1, value2)
end
