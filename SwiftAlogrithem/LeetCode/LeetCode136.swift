//
//  LeetCode136.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/3.
//

import Foundation
// 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素
// a^a=0；自己和自己异或等于0
// a^0=a；任何数字和0异或还等于他自己
class LeetCode136 {
    func singleNumber(_ nums: [Int]) -> Int {
        var num = 0
        for i in 0..<nums.count {
            num = num ^ nums[i]
        }
        return num
    }
}
