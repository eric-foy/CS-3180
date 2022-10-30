# Eric Foy
# nil for our purposes is an empty list

# Implements a pair?, null?, and list? method for ALL Ruby classes. 
class Object
  # Non-pair objects should return false when their pair? method is called;
  # objects of class Pair should return true.
  # Parameters: None
  # Returns: true if object is of class pair
  def pair?
    return (self.class == Pair)
  end

  # Returns true only if the pair is an empty list.
  # Parameters: None
  # Returns: true if nil, which is an empty list.
  def null?
    return (self == nil)
  end

  # As in Racket a null object should return false when its pair? method is
  # called, and true when its list? method is called.
  # Parameters: None
  # Returns: true if nil
  def list?
    return (self == nil)
  end
end

# A Ruby class called Pair that provides much of the functionality of the cons
# box (a.k.a. dotted pair) in Racket.
class Pair
  # value1 and value2 can be objects of any class, including class Pair.
  # Parameters:
  # value1 - object of any class
  # value2 - object of any class
  def initialize(value1, value2)
    @value1 = value1
    @value2 = value2
  end

  # Return the car of the pair.
  # Parameters: None
  # Returns: value1, which is the car in racket
  def car
    return @value1
  end

  # Return the cdr of the pair.
  # Parameters: None
  # Returns: value2, which is the cdr in racket
  def cdr
    return @value2
  end

  # return (not print!) a string representation of the pair. The string
  # representation should appear exactly as it would in DrRacket.
  # Parameters: None
  # Returns: formated string of the pair, value1 and value2
  def to_s
    o = ""
    v = self
    while (v.pair? && v.cdr.pair?)
      # strings in DrRacket appear with their parentheses
      a = v.car
      if (a.class == String)
        a = '"' + a + '"'
      end

      o = "#{o} #{a}"
      v = v.cdr
    end

    # strings in DrRacket appear with their parentheses
    b = v.car
    if (b.class == String)
      b = '"' + b + '"'
    end

    o = "#{o} #{b}"
    if (v.cdr.null?)
      return "(#{o.lstrip})"
    else
      # strings in DrRacket appear with their parentheses
      c = v.cdr
      if (c.class == String)
        c = '"' + c + '"'
      end

      return "(#{o.lstrip} . #{c})"
    end
  end
  
  # returns true if the pair is a valid list, false if not. Should behave the
  # same as Racket’s (list? ) function.
  # Parameters: None
  # Returns: true if the pair is a valid list
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

  # If the pair is a list, count should return the number of items in the top
  # level of the list. If not, it should return false
  # Parameters: None
  # Returns: number of items in the list if it is a list
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

  # If the pair is a list, append should return a new list consisting of other
  # appended to the original list. The original list should not be modified!
  # Other can be a list or an atomic data type. If the pair is not a list,
  # append should return false.  The new list and its values should not be
  # linked to the original list.
  # Parameters:
  # other - a list or an atomic data type
  # Returns: other appended to self if self is a list
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

  # Returns true only if the pair is an empty list.
  # Parameters: None
  # Returns: true if the pair is nil, an empty list
  def null?
    return (self == nil)
  end

  # You will need to implement a null/empty list value. You may use Ruby’s nil
  # constant (an object of class NilClass). The class method Pair.null should
  # return a null object.
  # Parameters: None
  # Returns: nil, an empty list
  def self.null
    return nil
  end
end

# You create a new pair using either the class method Pair.new(value1, value2)
# or using: the global method cons(value1, value2).
# Parameters:
# value1 - object of any class
# value2 - object of any class
# Returns: new pair of class Pair
def cons(value1, value2)
  return Pair.new(value1, value2)
end
