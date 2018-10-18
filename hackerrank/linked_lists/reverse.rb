def reverse(head)
  current = head
  prev = nil
  
  while current
    _next = current.next
    
    current.prev = _next
    current.next = prev
    
    prev = current
    current = _next
  end
  
  prev
end