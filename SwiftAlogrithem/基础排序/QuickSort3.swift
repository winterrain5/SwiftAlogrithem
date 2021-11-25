//
//  QuickSort3.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/24.
//
// 三路排序
import Cocoa

class QuickSort3 {
    func quickSort<T>(arr:inout [T])  where T : Comparable {
        if arr.count == 0 { return }
        sort(arr: &arr,l: 0,r:arr.count - 1)
        
    }
    
    func sort<T>(arr:inout [T],l:Int,r:Int)  where T : Comparable {
        if l >= r { return }
        
        let p =  arc4random_uniform(UInt32(r-l)) + UInt32(l)
        arr.swapAt(l, Int(p)) // 针对有序数组的优化
         // arr[l+1...lt] < v, arr[lt+1...i-1] == v, arr[gt+1...r] > v
        var lt = l,gt = r + 1,i = l + 1
        while i < gt {
            if arr[i] < arr[l] {
                lt += 1
                arr.swapAt(i, lt)
                i += 1
            } else if arr[i] > arr[l] {
                gt -= 1
                arr.swapAt(i, gt)
            } else {
                i += 1
            }
        }
        arr.swapAt(l, lt)
        // arr[l...lt - 1] < v, arr[lt...gt-1] == v, arr[gt...r] > v
        sort(arr: &arr,l:l,r:lt-1)
        sort(arr: &arr, l: gt, r: r)
    }
     
   
}
