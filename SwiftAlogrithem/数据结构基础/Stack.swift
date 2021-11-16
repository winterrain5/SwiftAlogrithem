//
//  Stack.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/16.
//

import Foundation

protocol Stack {
    associatedtype E
    func getSize() -> Int
    func isEmpty() -> Bool
    @discardableResult
    func pop() -> E?
    @discardableResult
    func peek() -> E?
    func push(_ e:E)
}
