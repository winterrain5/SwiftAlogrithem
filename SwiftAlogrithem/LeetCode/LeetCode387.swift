//
//  LeetCode387.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/3.
//

import Foundation
// 给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素
// 摩尔投票，用一个数字count 记录多数元素的重复次数，result 记录当前的多数元素，遍历数组，如果当前数字和多数元素相同，则count +1，否则count -1，当count 减为0时，result 清空，最后遍历完，result 就是多数元素
class LeetCode387 {
    func firstUniqChar(_ s:String) -> Int {
        var dict:[Character:Int] = [:]
        let characteArray = s.map({ $0 })
        for c in s {
            var count = dict[c] ?? 0
            count += 1
            dict[c] = count
        }

        for c in s {
            if dict[c] == 1 {
                return characteArray.firstIndex(of: c) ?? -1
            }
        }

        return -1
    }
}
