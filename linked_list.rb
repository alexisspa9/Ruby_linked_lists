class LinkedList
	require "./node.rb"

	def initialize()
		@head = Node.new
		@tail = Node.new
		@head.next_node = @tail
	end
	#append adds a new node to the end of the list
	def append(value)
		if @tail.value == nil
			@tail.value = value
		else
			node = Node.new
			node.value = value
			@tail.next_node = node
			@tail = node 
		end
	end
	#prepend adds a new node to the start of the list
	def prepend(value)
		if @head.value == nil
			@head.value = value
		else
			node = Node.new
			node.value = value
			node.next_node = @head
			@head = node 
		end
	end
	#size returns the total number of nodes in the list
	def size
		count = 0
		first = @head
		while first.next_node != nil
			count = count + 1
			first = first.next_node
		end
		count + 1
	end
	#head returns the first node in the list
	def head
		@head		
	end
	#tail returns the last node in the list
	def tail
		@tail		
	end
	#at(index) returns the node at the given index
	def at(indexPos)
		if size >= indexPos + 1
			first = @head
			indexPos.times do
				first = first.next_node
			end
			first
		end	
	end
	#pop removes the last element from the list
	def pop	
		if size > 1
			previous_node = at(size - 2)
			@tail = previous_node
			@tail.next_node = nil
		end	
	end
	#contains? returns true if the passed in value is in the list and otherwise returns false.
	def contains?(value)
		first = @head
		contained = false
		size.times do
			if first.value === value
			 contained = true
			end
			first = first.next_node
		end
		contained
	end
	#find(data) returns the index of the node containing data, or nil if not found.
	def find(data)
		first = @head
		index_pos = nil
		count = 0
		while count < size do
			if first.value === data
			 index_pos = count
			end
			first = first.next_node
			count = count + 1
		end
		index_pos		
	end
	#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( data ) -> ( data ) -> ( data ) -> nil
	def to_s
		first = @head
		size.times do 
			print("( #{first.value} ) -> ")
			first = first.next_node
		end	
		print(" nil ")	
	end

	### Extra Credit

	#insert_at(index) that inserts the node at the given index
	def insert_at(indexPos)
		node = at(indexPos)
		if node
			before_node = at(indexPos - 1)
			new_node = Node.new
			new_node.next_node = node
			before_node.next_node = new_node
		end		
	end
	#remove_at(index) that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.)
	def remove_at(indexPos)	
		node = at(indexPos)
		if node
			before_node = at(indexPos - 1)
			before_node.next_node = node.next_node
		end		
	end
end

my_list = LinkedList.new
my_list.append("should be the tail")
my_list.prepend("first head. should be the 3 element at index 2")
puts my_list.head.value
puts my_list.head.next_node.value
puts my_list.tail.value
puts my_list.tail.next_node
my_list.prepend("this is the new head")
puts my_list.head.value
puts my_list.head.next_node.value
puts my_list.head.next_node.next_node.value
my_list.prepend("this is the newest head")
puts my_list.tail.value
puts my_list.size
puts my_list.at(2).value
puts my_list.contains?("this is the new head")
puts my_list.find("this is the new head")
my_list.pop
puts my_list.size
puts my_list.at(2).value
puts my_list.tail.value
puts my_list.to_s




