class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max){false}
    # @set = {}
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] == true
      true
    else
      false
    end 
  end

  private

  def is_valid?(num) #boolean
     if num > @store.length || num < 0
        false
     else
        true
     end
  end

  def validate!(num) #error
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num 
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num 
    @count += 1
    resize! if num_buckets == @count
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # old = self.store

    old = Array.new(num_buckets*2) { Array.new }
    @store.each do |bucket|
      bucket.each do |ele|
        old[ele % old.length] << ele
      end
    end
    @store = old
  end
end
