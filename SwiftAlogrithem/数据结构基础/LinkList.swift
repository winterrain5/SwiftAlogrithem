//
//  LinkList.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/16.
//

import Foundation

class LinkList<E>:CustomStringConvertible where E:Equatable{
    private class Node:CustomStringConvertible {
        var e:E?
        var next:Node?
        init(_ e:E,next:Node?) {
            self.e = e
            self.next = next
        }
        
        init(_ e:E) {
            self.e = e
            self.next = nil
        }
         
        init() {
            self.e = nil
            self.next = nil
        }
        var description: String {
            String(describing: e) 
        }
    }
    // 虚拟头结点
    private var dummyHead = Node()
    private var size:Int = 0
    
    
    /// 获取链表中元素的个数
    func  getSize() -> Int { size }
    
    /// 返回链表是否为空
    func isEmpty() -> Bool { size == 0 }
    
  
    /// 在链表的index位置添加新的元素e 非常用操作
    func add(at index:Int,_ e:E) {
        assert(index >= 0 && index <= size , "add failed. Illegal index")
        
        var prve:Node? = dummyHead
        for _ in 0..<index {
            prve = prve?.next
        }
        
//            let node = Node(e)
//            node.next = prve?.next
//            prve?.next = node
        // 与上三行等价
        prve?.next = Node(e,next: prve?.next)
        size += 1

    }
    
    
    /// 在链表头添加元素
    func addFirst(_ e:E) {
        add(at: 0, e)
    }
    
    /// 在链表尾部添加元素
    func addLast(_ e:E) {
        add(at: size, e)
    }
    
    /// 获取index位置元素 非常用操作
    func getElement(at index:Int) -> E?{
        if index < 0 || index > size {
            assertionFailure("get failed. Illegal index")
            return nil
        }
        
        var cur = dummyHead.next
        for _ in 0...index {
            cur = cur?.next
        }
        return cur?.e
    }
    
    func getFirst() -> E? {
        getElement(at: 0)
    }
    
    func getLast() -> E? {
        getElement(at: size - 1)
    }
    
    // 修改index位置元素
    func set(at index:Int,_ e:E) {
        assert(index >= 0 && index <= size, "add failed. Illegal index")
        
        var cur = dummyHead.next
        for _ in 0...index {
            cur = cur?.next
        }
        cur?.e = e
    }
    
    // 查找链表中是否有元素e
    func contains(_ e:E) -> Bool {
        var cur = dummyHead.next
        while cur != nil {
            if cur?.e == e {
                return true
            }
            cur = cur?.next
        }
        return false
    }
    
    @discardableResult
    func remove(at index:Int) -> E?{
        assert(index >= 0 && index <= size, "add failed. Illegal index")
        
        var prve:Node? = dummyHead
        for _ in 0..<index {
            prve = prve?.next
        }
        
        let retNode = prve?.next
        prve?.next = retNode?.next
        retNode?.next = nil
        
        size -= 1
        
        return retNode?.e
        
    }
    
    @discardableResult
    func removeFirst() -> E? {
        remove(at: 0)
    }
    
    @discardableResult
    func removeLast() -> E? {
        remove(at: size - 1)
    }
    
    var description: String {
        var result = ""
        var cur = dummyHead.next
        for _ in 0..<size {
            let str = String(describing: cur?.description ?? "")
            result.append(str + "->")
            cur = cur?.next
        }
        result.append("null")
        
        return result
    }
}
