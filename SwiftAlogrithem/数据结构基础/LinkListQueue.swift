//
//  LinkListQueue.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/16.
//

import Foundation

class LinkListQueue<T:Equatable>: Queue,CustomStringConvertible{
    
    typealias E = T
    
    private class Node:CustomStringConvertible {
        var e:T?
        var next:Node?
        init(_ e:T,next:Node?) {
            self.e = e
            self.next = next
        }
        
        init(_ e:T) {
            self.e = e
            self.next = nil
        }
         
        init() {
            self.e = nil
            self.next = nil
        }
        var description: String {
            return String(describing: e)
        }
    }
    
    private var head:Node?
    private var tail:Node?
    private var size:Int = 0
    
    func getSize() -> Int { size }
    
    func isEmpty() -> Bool { size == 0 }
    
    /// 入队
    func enqueue(_ e: T) {
        if tail == nil {
            tail = Node(e)
            head = tail
        }else {
            tail?.next = Node(e)
            tail = tail?.next
        }
        size += 1
    }
    @discardableResult
    func dequeue() -> T? {
        if isEmpty() {
            assertionFailure()
            return nil
        }
        
        let retNode = head
        head = head?.next
        retNode?.next = nil
        
        if head == nil {
            tail = nil
        }
        
        size -= 1
        
        return retNode?.e
    }
    @discardableResult
    func getFront() -> T? {
        if isEmpty() {
            assertionFailure()
            return nil
        }
        
        return head?.e
    }
    
    var description: String {
        var result = ""
        result.append("Queue:\nfront \n")
        var cur = head
        for _ in 0..<size {
            let str = cur?.description ?? ""
            result.append(str + "->")
            cur = cur?.next
        }
        result.append("null\ntail")
        return result
    }
}
