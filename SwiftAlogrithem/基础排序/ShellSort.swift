//
//  HealSort.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/2.
//

import Cocoa
// O(nlogn) ~ O(n^2)
class ShellSort: Sortable {
    func sort<T>(arr: [T]) -> [T] where T : Comparable {
        var result = arr
        var h = 1
        while h < result.count {
            h = h * 3 + 1
        }
        
        while h > 0 {
            for pos in 0..<h {
                insertionSort(&result, start: pos, gap: h)
            }
            h = h / 3
        }
        
        return result
    }
    
    public func insertionSort<T:Comparable>(_ list: inout [T], start: Int, gap: Int) {
        for i in stride(from: (start + gap), to: list.count, by: gap) {
            let currentValue = list[i]
            var pos = i
            while pos >= gap && list[pos - gap] > currentValue {
                list[pos] = list[pos - gap]
                pos -= gap
            }
            list[pos] = currentValue
        }
    }
}
