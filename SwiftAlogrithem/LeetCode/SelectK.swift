//
//  LeetCode215.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/24.
//

import Foundation
class SelectK {
    @discardableResult
    static func selectK(arr:inout [Int],l:Int,r:Int,k:Int) -> Int {
        let p = partition(arr: &arr, l: l, r: r)
        
        if k == p {
            return arr[p]
        }
        if k < p { // 左边
            return selectK(arr: &arr, l: l, r: p - 1, k: k)
        }
        return selectK(arr: &arr, l: p + 1, r: r, k: k)
    }
    static func partition<T:Comparable>(arr:inout [T],l:Int,r:Int) -> Int{
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
    
    // 求第k大元素
    /*
     非常简单,我们只需在调用 select之南,将求第k大元的这个k,转换成对应求的是第几小元对应的素引好了
     按题目描述,如果k是1,对应就是找最大元素,那么相应的我们的 selectk的素引,就是s, length-1
     如果k是nuns.1 ength,其实就是求最小元素。那么那么相应的我们的 select的素引,就是0,
     */
    static func findKthLargest(nums:inout [Int],k:Int) -> Int{
        return selectK(arr: &nums, l: 0, r: nums.count - 1, k: nums.count - k)
    }
    
    // 最小的k个数
    /*
     对于这个问题,我们只费使用上而的 select,找到第k小的数,然后, selecti的过程由于调用了 partition,所以会调整整个数组的内容,此时,这个第k小的数的前面所有元素,就是整个数组最小的k个数字了
     这里注意,我们求的第k小的数字,对应的引是k-1,所以我们调用 select的时候,需受传入的素引参数是k-1
     另外,对于这个问题,k可能取0,此时,我们不需受执行 selectk,直接返回一个含有0个元素的int就好了
     */
    static func getLeastNums(arr:inout [Int],k:Int) -> [Int] {
        var result:[Int] = []
        if k == 0 { return result }
        selectK(arr: &arr, l: 0, r: arr.count - 1, k: k - 1)
        arr.enumerated().forEach { i,e in
            if i < k {
                result.append(e)
            } 
        }
        return result
    }
}
