static int findMergeNode(Node head1, Node head2) {
  Node node1 = head1, node2 = head2;
  
  while (node1 != node2) {
    node1 = node1.next == null ? head2 : node1.next;
    node2 = node2.next == null ? head1 : node2.next;
  }
  
  return node1.data;
}