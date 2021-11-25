//
//  QuickSort2.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/24.
//

import Cocoa
// 双路排序  
class QuickSort2  {
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
         // arr[l+1...i-1] <= v,arr[j+1...r] >= v
        var i = l + 1,j = r
        while true {
            while i <= j && arr[i] < arr[l] {
                i += 1
            }
            while j >= i && arr[j] > arr[l] {
                j -= 1
            }
            
            if i >= j { break }
            
            arr.swapAt(i, j)
            i += 1
            j -= 1
        }
        
        arr.swapAt(l, j)
        return j
    }
}
