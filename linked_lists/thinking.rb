# --- --- ---
# You will need two classes:
   # LinkedList class, which will represent the full list.
   # Node class, containing a #value method and a link to the #next_node, set both as nil by default.
# Build the following methods in your linked list class:
   # #append(value) adds a new node containing value to the end of the list
   # #prepend(value) adds a new node containing value to the start of the list
   # #size returns the total number of nodes in the list
   # #head returns the first node in the list
   # #tail returns the last node in the list
   # #at(index) returns the node at the given index
   # #pop removes the last element from the list
   # #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
   # #find(value) returns the index of the node containing value, or nil if not found.
   # #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
# Extra Credit
   # #insert_at(value, index) that inserts the node with the provided value at the given index
   # #remove_at(index) that removes the node at the given index. (You will need to update the links of your nodes in the list when you remove a node.)
# --- --- ---

# ...? the assignment is to build a data structure?
# nodes are objects to store.. arbitrary data types... hm.
# how would i get the pointer value? random doesn't seem like the right idea. object-id maybe?

# ...? can i put the thing itself there? like variable1 = variable2 sets equal?
# is that the intention?

# append(value):
   # node = Node.new(value)
   # @head.nil? ? @head = node : @tail.next_node = node
   # @tail = node
# i find this version a lot harder to read.

# hmm, this is more like a russian doll than a list of links.
# call object by ID?
   # "One problem you may run into is that if the only 'reference' you keep to an object is the object_id, the object can be collected by GC when you're not looking."
# "ObjectSpace._id2ref(id)" calls object, apparently.
# yeah, this was what i had in mind.

# should i do node.next or next(node)?
# oh, "next" is a reserved work. okay then.
# ...? but it works? bad practice i suppose. rename then..