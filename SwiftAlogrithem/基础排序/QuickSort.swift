//
//  QuickSort.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/23.
//

import Cocoa
// O(nlogn)
class QuickSort: Sortable {
    func sort<T>(arr: [T]) -> [T] where T : Comparable {
        guard arr.count > 1 else { return arr }

          let pivot = arr[arr.count/2]
          let less = arr.filter { $0 < pivot }
          let equal = arr.filter { $0 == pivot }
          let greater = arr.filter { $0 > pivot }

        return sort(arr: less) + equal + sort(arr:  greater)
    }
    
    func quickSort<T>(arr:inout [T])  where T : Comparable {
        if arr.count == 0 { return }
        sort(arr: &arr,l: 0,r:arr.count - 1)
        
    }
    
    func sort<T>(arr:inout [T],l:Int,r:Int)  where T : Comparable {
        if l >= r { return }
        let p = partition(arr: &arr, l: l, r: r)
        sort(arr: &arr,l:l,r:p-1)
        sort(arr: &arr, l: p+1, r: r)
    }
     
    private func partition<T:Comparable>(arr:inout [T],l:Int,r:Int) -> Int{
        let p =  arc4random_uniform(UInt32(r-l)) + UInt32(l)
        arr.swapAt(l, Int(p)) // 针对有序数组的优化
         // arr[l+1...j] < v,arr[j+1...i] >= v
        var j = l
        for i in l...r {
            if arr[i] < arr[l] {
                j += 1
                arr.swapAt(i, j)
            }
        }
        arr.swapAt(l, j)
        return j
    }
}
