//
//  LeetCode303.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/6.
//

import Cocoa

class LeetCode303 {
    private var segmentTree:SegmentTree<Int>
    init(_ nums: [Int]) {
        segmentTree = SegmentTree(array: nums, leftBound: 0, rightBound: nums.count - 1, function: +)
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return segmentTree.query(withLeftBound: left, rightBound: right)
    }
}

class LeetCode303_2 {
    /// sum[i] 存储前i个元素的和
    private var sums:[Int] = []
    
    init(_ nums: [Int]) {
        sums = nums
        sums.insert(0, at: 0)
        for i in 1...nums.count {
            sums[i] = sums[i - 1] + nums[i - 1]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return sums[right + 1] - sums[left]
    }
}
