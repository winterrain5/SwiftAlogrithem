//
//  LeetCode206.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/18.
//

import Foundation
class ListNode {
    var val:Int
    var next:ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class LeetCode206 {
    static func reverseList(head:ListNode?) -> ListNode?{
        var pre:ListNode? = nil
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    
    static func reverseList2(head:ListNode?) -> ListNode?{
        if head == nil || head?.next == nil {
            return head
        }
        
        let rev = reverseList2(head: head?.next)
        head?.next?.next = head
        head?.next = nil
        return rev
    }
}
