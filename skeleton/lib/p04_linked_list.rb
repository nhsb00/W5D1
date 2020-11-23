class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
  end
end

class LinkedList

  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    old_node = @tail.prev

    old_node.next = new_node
    @tail.prev = new_node
    # set variables for tail.prev
    # make new_node tail.prev, and oldnode.next
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    array = [@head.next]
    values = []

    until array[0] == @tail
      node = array.shift
      p node.next
      array << node.next
      values << node.val
    end

    values

    #until @tail
    # [] << @head.next.val 
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
