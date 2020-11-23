class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # result = []
    # self.each { |ele| result << ele.hash }

    new_hash = 0
    self.each_with_index { |ele, i| new_hash += ele.hash * (i + 1) }
    new_hash
  end
end

class String 
  def hash  # ['s','t']

    array = self.split('')

    new_hash = 0
    array.each_with_index { |ele, i| new_hash += (ele.ord).hash * i }
    new_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    arry = self.to_a.sort

    arry.hash
  end
end
