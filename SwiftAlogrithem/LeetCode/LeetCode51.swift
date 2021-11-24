//
//  LeetCode51.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/19.
//

/// 逆序对问题
import Foundation

class LeetCode51 {
    private var temp:[Int] = []
     func reversePairs(_ nums:[Int]) -> Int{
        
        temp = nums
        return sort(arr: nums, l: 0, r: nums.count - 1)
        
    }
    
    func sort(arr:[Int],l:Int,r:Int) -> Int {
        if l >= r { return 0 }
        var res = 0
        let mid = l + (r - l) / 2
        res += sort(arr: arr, l: l, r: mid)
        res += sort(arr: arr, l: mid + 1, r: r)
        if arr[mid] > arr[mid + 1] {
            res += merge(arr: arr, l: l, mid: mid, r: r)
        }
        return res
    }
    
    func merge(arr:[Int],l:Int,mid:Int,r:Int) -> Int{
        var oriArr = arr
        var i = l,j = mid + 1
        var res = 0
        for k in l...r {
            if i > mid {
                oriArr[k] = temp[j]
                j += 1
            }else if j > r {
                oriArr[k] = temp[i]
                i += 1
            }else if temp[i] <= temp[j] {
                oriArr[k] = temp[i]
                i += 1
            }else {
                res += mid - i + 1
                oriArr[k] = temp[j]
                j += 1
            }
         }
        
        return res
    }
}
 
