//
//  MaxHeap.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/1.
//

import Foundation
// 最大堆
class MaxHeap<E> where E : Comparable {
    private var data:Array<E>
    
    public var size:Int { data.count }
    public var isEmpty:Bool { data.isEmpty }
    
    init() {
        data = Array()
    }
    
    init(_ arr:[E]) {
        data = arr
        for i in 0...parent(arr.count - 1) {
            siftDown(index: i)
        }
    }
    
    /// 返回完全二叉树的数组表示中，一个索引表示的元素的父亲节点的索引
    private func parent(_ index:Int) -> Int {
        if index == 0 {
            assertionFailure("index 0 does not have parent")
        }
        return (index -  1) / 2
    }
    
    private func leftChild(_ index:Int) -> Int{
      return index * 2 + 1
    }
    
    private func rightChild(_ index:Int) -> Int{
      return index * 2 + 2
    }
    
    public func add(_ e:E) {
        data.append(e)
        siftUp(index: data.count - 1)
    }
    private func siftUp(index: Int) {
        var k = index
        while k > 0 && (data[parent(k)] < data[k]){
            data.swapAt(k, parent(k))
            k = parent(k)
        }
    }
    
    public func findMax() -> E {
        if data.count == 0 {
            assertionFailure("Data is Empty")
        }
        return data.first!
    }
    
    // 取出最大元素
    public func extractMax() -> E {
        let ret = findMax()
        data.swapAt(0, data.count - 1)
        data.removeLast()
        siftDown(index: 0)
        return ret
    }
    private func siftDown(index:Int) {
        var k = index
        while leftChild(k) < data.count {
            // 找出左右孩子中最大值对应的索引
            var j = leftChild(k)
            if j + 1 < data.count && data[j+1] > data[j] {
                j = rightChild(k)
            }
            // 以上操作后 data[j]是 leftChild 和 rightChild 中最大值
            
            if data[k] >= data[j] { break }
            
            data.swapAt(k, j)
            k = j
        }
    }
    
    /// 取出堆中最大的元素，并且替换成e
    public func replace(_ e:E) -> E {
        let ret = findMax()
        data.insert(e, at: 0)
        siftDown(index: 0)
        return ret
    }
    
    
}
