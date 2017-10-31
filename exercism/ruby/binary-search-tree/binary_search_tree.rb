require 'set'

module BookKeeping
  VERSION = 1
end

class Bst
  def initialize(data)
    @root = Node.new(data)
  end

  def insert(data)
    @root.insert(data)
  end

  def data
    @root.data
  end

  def left
    @root.left
  end

  def right
    @root.right
  end

  def each
    return to_enum(:each) unless block_given?
    
    stack = [@root]
    yielded = Set.new

    while !stack.empty?
      last = stack.last
      if last.left && !yielded.include?(last.left)
        stack.push(last.left)
      else
        node = stack.pop
        yield(node.data)
        yielded.add(node)
        stack.push(node.right) if node.right
      end
    end
  end
end

class Node
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(data)
    if @data >= data
      left_insert(data)
    else
      right_insert(data)
    end
  end

  def left_insert(data)
    if @left
      @left.insert(data)
    else
      @left = Node.new(data)
    end
  end

  def right_insert(data)
    if @right
      @right.insert(data)
    else
      @right = Node.new(data)
    end
  end
end
