//
//  Queue.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/16.
//

import Foundation

protocol Queue {
    associatedtype E
    func getSize() -> Int
    func isEmpty() -> Bool
    func enqueue(_ e:E)
    @discardableResult
    func dequeue() -> E?
    @discardableResult
    func getFront() -> E?
}
