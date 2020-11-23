class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
    self[key.hash] << key 
    @count += 1
    resize! if num_buckets == @count
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
  end

  def include?(key)
    self[key.hash].include?(key)
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
    new_store = Array.new(num_buckets*2) { Array.new }
    @store.each do |bucket|
      bucket.each do |ele|
        new_store[ele.hash % new_store.length] << ele
      end
    end
    @store = new_store
  end
end
