//
//  SelectionSort.swift
//  SwiftAlogrithm
//
//  Created by VICTOR03 on 2021/11/3.
//

import Foundation
// O(n^2)
class SelectionSort:Sortable {
    func sort(arr:[Int]) -> [Int]{
        var a = arr
        for i in 0..<a.count {
            
            var minIndex = i
            for j in i+1..<a.count {
                if a[j] < a[minIndex] {
                    minIndex = j
                }
            }
            a.swapAt(i, minIndex)
        }
        return a
    }
    
    func sort<T:Comparable>(arr:[T],_ isLowerThan:(T,T) -> Bool) -> [T] {
        var a = arr
        for i in 0..<a.count {
            
            var minIndex = i
            for j in i+1..<a.count {
                if isLowerThan(a[j],a[minIndex]) {
                    minIndex = j
                }
            }
            a.swapAt(i, minIndex)
             
        }
        return a
    }
    
    @discardableResult
    func sort<T:Comparable>(arr:[T]) -> [T] {
        sort(arr: arr, <)
    }
    
}
