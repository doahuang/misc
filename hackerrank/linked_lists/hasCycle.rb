def hasCycle(head)
  return false if !head

  node = head
  seen = {}

  while node 
    return true if seen[node]

    seen[node] = true
    node = node.next
  end

  return false
end