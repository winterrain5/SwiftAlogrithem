//
//  BubbleSort.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/2.
//

import Cocoa
//O(n^2)
class BubbleSort: Sortable {
    func sort<T>(arr: [T]) -> [T] where T : Comparable {
        var result = arr
        
        for var i in 0..<result.count - 1{ // 遍历 n - 1 次
            
            // arr[n-i,n)已排好序
            // 通过冒泡在arr[n-i-1]位置放上合适的元素
            var lastSwapedIndex = 0
            for j in 0..<result.count - i - 1 {
                if result[j] > result[j+1] {
                    lastSwapedIndex = j + 1
                    result.swapAt(j, j+1)
                }
            }
            i = result.count - lastSwapedIndex
        }
        
        return result
    }
}
