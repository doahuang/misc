def insertNodeAtPosition(llist, data, position)
  node = SinglyLinkedListNode.new(data)
  
  current = llist
  
  (position - 1).times do
    current = current.next
  end
  
  node.next = current.next
  current.next = node
  
  llist
end