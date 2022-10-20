class Pair
  def initialize(value1, value2)
    @value1 = value1
    @value2 = value2
  end

  def car
    @value1
  end

  def cdr
    @value2
  end

  def to_s
    #TODO test if value is a pair
    "(#{@value1} . #{@value2})"
  end
end

def cons(value1, value2)
  Pair.new(value1, value2)
end
