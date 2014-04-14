require 'set'

class Pair
  attr_reader :pair, :time

  def initialize(name1, name2)
    @pair = Set.new([name1, name2])
    @time = Time.now
  end

  def member?(name)
    @pair.member?(name)
  end

  def remove(name)
    @pair.delete(name)
  end

  def invalid?
    @pair.size < 2
  end
end
    


class Pairs
  def initialize
    @pairs = []
    @names = Set.new
  end
    
  def remove_from_pair(name)
    @pairs.each_with_index do |pair, idx|
            if pair.member?(name)
              pair.remove(name)
              if pair.invalid?
                @pairs.delete_at(idx)
                return true
              end
            end
          end
    return false
  end

  def make_pair(name1, name2)
    remove_from_pair(name1)
    remove_from_pair(name2)
    @pairs << Pair.new(name1, name2)
    @names += [name1, name2]
  end

  def paired?(name)
    @pairs.each do |pair|
            if pair.member?(name)
              return true
            end
          end
    return false
  end
end
