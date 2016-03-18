class MyQueue


  def initialize
    @store = []
  end

  def enqueue(n)
    @store.push(n)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end

end


class MyStack

  def initialize
    @store = []
    @max = []
    @min = []
  end

  def pop
    if @max.last == @store.last
      @max.pop
    elsif @min.last == @store.last
      @min.pop
    end
    @store.pop

  end

  def push(n)
    @store.push(n)
    @max << n if n > @max.last || @max.nil?
    @min << n if n < @min.last || @min.nil? 
  end

  def peek(n)
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end

  def max
    @max.last
  end

  def min
    @min.last
  end

end


class StackQueue

  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(n)
    @in_stack.push(n)
  end

  def dequeue
    until @in_stack.empty?
      @out_stack.push(@in_stack.pop)
    end
    @out_stack.pop
    until @out_stack.empty?
      @in_stack.push(@out_stack.pop)
    end

  def size
    @in_stack.size
  end

  def empty?
    @in_stack.empty?
  end

  def max
    @in_stack.max
  end

  def min
    @in_stack.min
  end

end
