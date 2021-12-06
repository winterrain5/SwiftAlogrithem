//
//  PriorityQueue.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/2.
//

import Cocoa

class PriorityQueue<T : Comparable>: Queue {
    typealias E = T
    
    private var maxHeap = MaxHeap<T>()
    
    func getSize() -> Int {
        maxHeap.size
    }
    
    func isEmpty() -> Bool {
        maxHeap.isEmpty
    }
    
    func enqueue(_ e: T) {
        maxHeap.add(e)
    }
    
    func dequeue() -> T? {
        maxHeap.extractMax()
    }
    
    func getFront() -> T? {
        maxHeap.findMax()
    }
    
    
    

}
