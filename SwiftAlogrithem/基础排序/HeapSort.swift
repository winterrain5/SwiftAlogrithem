//
//  HeapSort.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/1.
//

import Foundation
// O(nlogn)
class HeapSort:Sortable {
    func sort<T>(arr: [T]) -> [T] where T : Comparable {
        var result = arr
        let maxHeap = MaxHeap<T>()
        arr.forEach({ maxHeap.add($0) })
        for i in (0..<arr.count).reversed() {
            result[i] = maxHeap.extractMax()
        }
        return result
    }
}
