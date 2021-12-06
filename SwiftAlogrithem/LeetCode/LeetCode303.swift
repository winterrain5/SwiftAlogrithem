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
