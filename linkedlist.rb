class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if !@head
      @head = new_node
    elsif !@tail
      @head.next_node = new_node
      @tail = @head.next_node
    else
      @tail.next_node = new_node
      @tail = @tail.next_node
    end
  end

  def prepend(value)
    if !@head
      @head = Node.new(value)
    else
      @head = Node.new(value, @head)
    end
  end

  def size
    current_node = @head
    count = 0
    while current_node
      count += 1
      current_node = current_node.next_node
    end
    return count
  end

  def at(index)
    return nil if index >= self.size
    count = 0
    current_node = @head
    while index != count
      current_node = current_node.next_node
      count += 1
    end
    return current_node.value
  end

  def pop
    return @head = nil if @head.next_node == nil
    current_node = @head
    current_node = current_node.next_node until current_node.next_node == @tail
    @tail = current_node
    @tail.next_node = nil
  end

  def contains?(val)
    current_node = @head
    while current_node
      return true if current_node.value == val
      current_node = current_node.next_node
    end
    return false
  end

  def find(data)
    current_node = @head
    count = 0
    while current_node
      return count if current_node.value == data
      current_node = current_node.next_node
      count +=1
    end
    return nil
  end

  def insert_at(index, val)
    return prepend(val) if index == 0
    return append(val) if index == self.size - 1

    current_node = @head
    count = 0
    while count != index - 1
      current_node = current_node.next_node
      count+=1
    end
    temp = current_node.next_node
    current_node.next_node = Node.new(val)
    current_node.next_node.next_node = temp
  end

  def remove_at(index)
    return pop if index == self.size-1
    return @head = @head.next_node if index == 0
    current_node = @head
    count = 0
    while count != index
      previous_node = current_node
      current_node = current_node.next_node
      count+=1
    end
    previous_node.next_node = current_node.next_node

  end


  def to_s
    current_node = @head
    str = ''
    while current_node
      str += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    str+='nil'
  end


end

class Node
  attr_accessor :value, :next_node
  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new()
list.append(1)
list.append(2)
list.append(3)
list.prepend(0)
list.prepend('hello')

puts list.to_s
