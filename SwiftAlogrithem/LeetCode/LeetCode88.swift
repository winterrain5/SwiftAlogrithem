//
//  LeetCode.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/3.
//

import Cocoa

class LeetCode88 {
    // 
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1
        var j = n - 1
        var end = m + n - 1 // 从后往前排
        while j >= 0 {
            if i >= 0 && nums1[i] > nums2[j] {
                nums1[end] = nums1[i]
                i -= 1
            }else {
                nums1[end] = nums2[j]
                j -= 1
            }
            end -= 1
        }
    }
}
