boolean hasCycle(Node head) {
  if (head == null) return false;
  
  Node slow = head, fast = head.next;
  
  while (slow != fast) {
    if (fast.next == null) return false;
    
    slow = slow.next;
    fast = fast.next.next;
  }
  
  return true;
}