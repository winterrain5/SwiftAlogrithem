//
//  SortHelper.swift
//  SwiftAlogrithm
//
//  Created by VICTOR03 on 2021/11/3.
//

import Foundation

class SortHelper {
    static func sortText<T:Comparable>(sortClass:Sortable,arr:[T]) {
        let start = CFAbsoluteTimeGetCurrent()
        let result = sortClass.sort(arr: arr)
        let end = CFAbsoluteTimeGetCurrent()
        let duration = end - start
        if !isSorted(arr: result) {
            print("\(sortClass) failed")
            return
        }
        print("执行时间：\(duration)s")
    }
    
    static func isSorted<T:Comparable>(arr:[T]) -> Bool {
        for i in 1..<arr.count {
            if arr[i-1] > arr[i] {
                return false
            }
        }
        return true
    }
}
