--- A double linked list.
--- @class flib_linked_list
local flib_linked_list = {}

--- @class LinkedList<T>: { head: LinkedListNode<T>?, tail: LinkedListNode<T>?, len: number }
--- @class LinkedListNode<T>: { content: T, next: LinkedListNode<T>?, prev: LinkedListNode<T>? }

--- @return LinkedList
function flib_linked_list.new()
  return { len = 0 }
end

--- @generic T
--- @param self LinkedList<T>
--- @param item `T`
function flib_linked_list.push_back(self, item)
  if not self.head and not self.tail then
    local node = { content = item }
    self.head = node
    self.tail = node
    return
  end
  local new_tail = { content = item, prev = self.tail }
  self.tail.next = new_tail
  self.tail = new_tail
  self.len = self.len + 1
end

--- @generic T
--- @param self LinkedList<T>
--- @param item `T`
function flib_linked_list.push_front(self, item)
  if not self.head and not self.tail then
    self.head = { content = item }
    return
  end
  local new_head = { content = item, next = self.head }
  self.head.prev = new_head
  self.head = new_head
  self.len = self.len + 1
end

return flib_linked_list
