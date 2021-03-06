//
//  SegmentTree.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/6.
//

import Cocoa

public class SegmentTree<T> {
    private var value: T
    private var function: (T, T) -> T
    private var leftBound: Int
    private var rightBound: Int
    private var leftChild: SegmentTree<T>?
    private var rightChild: SegmentTree<T>?
    
    public init(array: [T], leftBound: Int, rightBound: Int, function: @escaping (T, T) -> T) {
        self.leftBound = leftBound
        self.rightBound = rightBound
        self.function = function
        
        if leftBound == rightBound {                    // 1
            value = array[leftBound]
        } else {
            let middle = (leftBound + rightBound) / 2     // 2
            
            // 3
            leftChild = SegmentTree<T>(array: array, leftBound: leftBound, rightBound: middle, function: function)
            rightChild = SegmentTree<T>(array: array, leftBound: middle+1, rightBound: rightBound, function: function)
            
            value = function(leftChild!.value, rightChild!.value)  // 4
        }
    }
    
    public func query(withLeftBound leftBound: Int, rightBound: Int) -> T {
        // 1
        if self.leftBound == leftBound && self.rightBound == rightBound {
            return self.value
        }
        
        guard let leftChild = leftChild else { fatalError("leftChild should not be nil") }
        guard let rightChild = rightChild else { fatalError("rightChild should not be nil") }
        
        // 2
        if leftChild.rightBound < leftBound {
            return rightChild.query(withLeftBound: leftBound, rightBound: rightBound)
            
            // 3
        } else if rightChild.leftBound > rightBound {
            return leftChild.query(withLeftBound: leftBound, rightBound: rightBound)
            
            // 4
        } else {
            let leftResult = leftChild.query(withLeftBound: leftBound, rightBound: leftChild.rightBound)
            let rightResult = rightChild.query(withLeftBound: rightChild.leftBound, rightBound: rightBound)
            return function(leftResult, rightResult)
        }
    }
    
    public func replaceItem(at index: Int, withItem item: T) {
        if leftBound == rightBound {
            value = item
        } else if let leftChild = leftChild, let rightChild = rightChild {
            if leftChild.rightBound >= index {
                leftChild.replaceItem(at: index, withItem: item)
            } else {
                rightChild.replaceItem(at: index, withItem: item)
            }
            value = function(leftChild.value, rightChild.value)
        }
    }
}

