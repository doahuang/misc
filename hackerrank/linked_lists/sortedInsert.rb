def sortedInsert(head, data)
  node = DoublyLinkedListNode.new(data)
  
  current = head
  
  while current && current.data <= node.data
    prev = current
    current = current.next
  end
  
  if prev
    prev.next = node
    node.prev = prev
  end
  
  if current
    current.prev = node
    node.next = current
  end
  
  prev ? head : node
end