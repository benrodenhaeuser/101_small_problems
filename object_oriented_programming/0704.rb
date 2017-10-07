=begin

- a circular queue is a collection of objects stored in a buffer of a specific
  length treated as a circle.

- RULES of dequeuing/enqueuing:
  1. when an object is added to the queue, it is added to the position that
    follows the most recently added object.
  2. when an object is removed, the "oldest" object is removed.
  3. when the buffer is full, and an object is added, it is added in the place
    of the oldest object.

=end

# ----------------------------------------------------------------------------
# solution 1
# ----------------------------------------------------------------------------

class CircularQueue

  def initialize(size)
    @size = size
    @queue = [nil] * @size
    @most_recent_index = nil
    @least_recent_index = nil
  end

  def enqueue(elem)
    if empty?
      @queue[0] = elem
      @most_recent_index = 0
      @least_recent_index = 0
    else
      insertion_index = find_insertion_index
      @queue[insertion_index] = elem
      @most_recent_index = insertion_index
      if @least_recent_index == insertion_index
        @least_recent_index = (@least_recent_index + 1) % @size
      end
    end
  end

  def dequeue
    if empty?
      nil
    else
      removal_index = find_removal_index
      element_to_remove = @queue[removal_index]
      @queue[removal_index] = nil
      @least_recent_index = (@least_recent_index + 1) % @size
      element_to_remove
    end
  end

  private

  def full?
    @queue.all? { |elem| !elem.nil? }
  end

  def empty?
    @queue.all? { |elem| elem.nil? }
  end

  def find_insertion_index
    if full?
      @least_recent_index
    else
      (@most_recent_index + 1) % @size
    end
  end

  def find_removal_index
    @least_recent_index
  end
end

=begin

weaknesses:

- full? and empty? are both inefficient. we should not have to scan the full
  queue.
- the logic of enqueuing and dequeuing is fairly involved. shouldn't this be
  simpler?

=end

# ----------------------------------------------------------------------------
# solution 2
# ----------------------------------------------------------------------------

=begin
  express (3) above in terms of dequeue/enqueue

  if we want to enqueue and the queue is full:
    dequeue, then enqueue
=end

class CircularQueue

  def initialize(size)
    @size = size
    @queue = [nil] * @size
    @most_recent_index = nil
    @least_recent_index = nil
  end

  def enqueue(elem) # complicated!
    if empty?
      @queue[0] = elem
      @most_recent_index = 0
      @least_recent_index = 0
    elsif full?
      dequeue
      enqueue(elem)
    else
      insertion_index = (@most_recent_index + 1) % @size
      @queue[insertion_index] = elem
      @most_recent_index = insertion_index
      if @least_recent_index == insertion_index
        @least_recent_index = (@least_recent_index + 1) % @size
      end
    end
  end

  def dequeue
    if empty?
      nil
    else
      element_to_remove = @queue[@least_recent_index]
      @queue[@least_recent_index] = nil
      @least_recent_index = (@least_recent_index + 1) % @size
      element_to_remove
    end
  end

  private

  def full?
    @queue.all? { |elem| !elem.nil? }
  end

  def empty?
    @queue.all? { |elem| elem.nil? }
  end
end

# ----------------------------------------------------------------------------
# tests
# ----------------------------------------------------------------------------


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
