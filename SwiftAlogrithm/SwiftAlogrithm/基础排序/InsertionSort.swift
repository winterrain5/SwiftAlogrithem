//
//  InsertionSort.swift
//  SwiftAlogrithm
//
//  Created by VICTOR03 on 2021/11/3.
//

import Foundation

class InsertionSort:Sortable {
    func sort<T>(arr: [T]) -> [T] where T : Comparable {
        var a = arr
        for i in 0..<a.count {
            // 将arr[i]插入到合适的位置
            if i == 0 { continue }
            for j in (0..<i).reversed() {
                if a[j] < a[j-1] {
                    a.swapAt(j, j-1)
                }
                break
            }
        }
        return a
    }
}
