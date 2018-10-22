def findMergeNode(head1, head2)
  seen = {}
  node = head1

  while node
    seen[node] = true
    node = node.next
  end

  node = head2
  
  while node
    return node.data if seen[node]
    node = node.next
  end

  nil
end