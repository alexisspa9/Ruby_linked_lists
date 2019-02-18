class LinkedList
  attr_reader :size, :head, :tail
  def initialize
    @tail = nil
    @size = 0
    @head = nil
  end

  def append(value)
    # adds a new node to the end of the LinkedList
    new_node = Node.new(value)
    if @head
      @tail.next = new_node # address
    else
      @head = new_node
    end
    @size += 1
    @tail = new_node
  end

  def prepend(value)
    # adds a new node to the start of the LinkedList
    new_node = Node.new(value)
    if @head
      new_node.next = @head
    else
      @tail = new_node
    end
    @head = new_node
    @size += 1
  end

  def at(index)
    # returns node at given index
    if index >= @size || index < 0
      nil
    else
      current_node = @head
      index.times { current_node = current_node.next }
      current_node
    end
  end

  def pop
    # removes the last node in the list
    return if size.zero? # guard code

    current_node = @head
    current_node = current_node.next until current_node.next == @tail
    @tail = current_node
    pop = current_node.next
    current_node.next = nil
    @size -= 1
    pop
  end

  def contains?(value)
    # checks if passed value is in the list
    current_node = @head
    until current_node.value == value || current_node.next.nil?
      current_node = current_node.next
    end
    current_node.value == value
  end

  def find(value)
    # returns index of node containing data
    current_node = @head
    index = 0
    until current_node.value == value || current_node.next.nil?
      current_node = current_node.next
      index += 1
    end
    current_node.value == value ? index : nil
  end

  def to_s
    # represent node list as a String
    current_node = @head
    str = current_node.value
    until current_node.next.nil?
      current_node = current_node.next
      str = str + ' ' + current_node.value
    end
    str
  end
end

# Contains a link to the next node
class Node
  attr_accessor :value, :next
  # looks for global varialbes @value and @next
  def initialize(value)
    @value = value
    @next = nil
  end
end

list = LinkedList.new

list.append('item1')
list.append('item2')
list.append('item3')
list.append('item4')
system 'clear'
puts 'linked list'
puts list.to_s
puts 'head value:'
puts list.head.value
puts 'tail value:'
puts list.tail.value
puts 'prepend item'
list.prepend('item0')
puts 'head value:'
puts list.head.value
puts 'pop item'
puts 'removed:'
puts list.pop.value
puts 'tail value:'
puts list.tail.value
puts 'linked list size:'
puts list.size
puts 'node at index (1):'
puts list.at(1).value
puts 'node at index (5):'
puts list.at(5)
puts "contains? 'item5'"
puts list.contains?('item5')
puts "contains? 'item1'"
puts list.contains?('item1')
puts "find index of 'item4'"
puts list.find('item4')
puts "find index of 'item1'"
puts list.find('item1')
puts 'linked list'
puts list.to_s