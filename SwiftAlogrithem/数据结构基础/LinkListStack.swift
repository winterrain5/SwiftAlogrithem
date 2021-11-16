//
//  LinkListStack.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/16.
//

import Foundation

class LinkListStack<T:Equatable>: Stack,CustomStringConvertible {
    typealias E = T
    
    private var list:LinkList<T> = LinkList()
    
    func getSize() -> Int {
        list.getSize()
    }
    
    func isEmpty() -> Bool {
        list.isEmpty()
    }
    
    @discardableResult
    func pop() -> T? {
        list.removeFirst()
    }
    
    @discardableResult
    func peek() -> T? {
        list.getFirst()
    }
    
    func push(_ e: T) {
        list.addFirst(e)
    }
    
    var description: String {
        var result = ""
        result.append("stack: top ")
        result.append(list.description)
        return result
    }
}
