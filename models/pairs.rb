require 'set'

class Pair
  attr_reader :pair, :time
  attr_accessor :works_on

  def initialize(name1, name2, works_on=nil)
    @pair = Set.new([name1, name2])
    @time = Time.now
    @works_on = works_on
  end

  def member?(name)
    @pair.member?(name)
  end

  def members
    @pair.to_a
  end

  def remove(name)
    @pair.delete(name)
  end

  def add(name)
    @pair += [name]
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

  def paired?(name)
    @pairs.each do |pair|
            if pair.member?(name)
              return true
            end
          end
    return false
  end

  def paired_with(name)
    @pairs.each do |pair|
            if pair.member?(name)
              return pair.members.select {|i| i != name }
            end
          end
    return []
  end

  # name2 joins name1
  def joins(name1, name2)
    if paired?(name1)
      find(name1).add(name2)
    elsif paired?(name2)
      remove_from_pair(name2)
      @pairs << Pair.new(name1, name2)
    else
      @pairs << Pair.new(name1, name2)
    end
    @names += [name1, name2]
  end

  def start_work_on(name, task)
    if paired?(name)
      find(name).works_on = task
    end
  end

  def working_on(name)
    if paired?(name)
      find(name).works_on
    end
  end

  def list_pairs
    @pairs.collect do |pair|
            [pair.members, pair.works_on]
          end
  end

  private
  def find(name)
    @pairs.each do |pair|
            if pair.member?(name)
              return pair
            end
          end
    return nil
  end
end
