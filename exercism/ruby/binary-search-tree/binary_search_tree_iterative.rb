module BookKeeping
  VERSION = 1
end

class Bst
  include Enumerable

  attr_reader :size

  def initialize(data)
    @root = Node.new(data)
  end

  def insert(data)
    node = @root
    while node.data
      if node.data >= data
        node = node.left ||= Node.new
      else
        node = node.right ||= Node.new
      end
    end
    node.data = data
  end

  # TODO: iterative solution?
  def search(node = @root, data)
    return nil if node.nil?
    return data if node.data == data

    if node.data >= data
      node = node.left
    else
      node = node.right
    end

    search(node, data)
  end

  # TODO: iterative solution?
  def each(node = @root, &block)
    return to_enum(:each) unless block_given?

    each(node.left, &block) if node.left
    yield(node.data)
    each(node.right, &block) if node.right
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

  private

  class Node
    attr_accessor :data, :left, :right

    def initialize(data = nil)
      @data = data
    end
  end

  private_constant :Node
end
