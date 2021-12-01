//
//  BinarySearch2.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/25.
//

import Foundation
// 非递归
class BinarySearch2 {
    static func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0, r = nums.count - 1
        // 在 data[l...r]中查找
        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] == target { return mid }
            if nums[mid] < target {
                l = mid + 1
            }else {
                r = mid - 1
            }
        }
        return -1
    }
    
    // 大于 target 的最小值的索引
    static func upper(_ nums:[Int],_ target:Int) -> Int {
        var l = 0,r = nums.count
        
        while l < r {
            let mid = l + (r - l) / 2
            if nums[mid] <= target { // 解在右边 mid对应的元素及之前的元素都可以抛弃
                l = mid + 1
            }else {
                r = mid
            }
        }
        return l
    }
    
    // 大于 target 的最小值的索引
    // 等于 target 返回最大索引
    static func ceil(_ nums:[Int],_ target:Int) -> Int {
        let u = upper(nums, target)
        if nums[u - 1] == target && u - 1 >= 0{
            return u - 1
        }
        return u
    }
}
