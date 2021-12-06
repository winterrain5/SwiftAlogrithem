//
//  InsertionSort.swift
//  SwiftAlogrithm
//
//  Created by VICTOR03 on 2021/11/3.
//

import Foundation
// O(n^2)
class InsertionSort:Sortable {
    func sort<T>(arr: [T]) -> [T] where T : Comparable {
        var a = arr
        for x in 0..<a.count - 1{
            var lowest = x
            /// 在剩余的数组中寻找最小的值
            for y in x+1..<a.count {
                if a[y] < a[lowest] {
                    lowest = y
                }
            }
            if x != lowest {
                a.swapAt(x, lowest)
            }
        }
        return a
    }
}
