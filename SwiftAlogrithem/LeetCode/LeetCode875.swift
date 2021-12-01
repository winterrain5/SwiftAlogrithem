//
//  LeetCode875.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/25.
//

import Foundation
 
class LeetCode875 {
    func minEatingSpeed(_ piles:[Int],_ H:Int) -> Int{
        var l = 1,r = piles.max() ?? 0
        while l < r {
            let mid = l + (r - l) / 2
            if eatingTime(piles, mid) <= H { // 查找可能更小的解
                r = mid
            }else {
                l = mid + 1
            }
        }
        return l
    }
    
    // 每小时吃掉K个香蕉花费的总时间
    func eatingTime(_ piles:[Int],_ k:Int) -> Int {
        var res = 0
        for pile in piles {
            res += pile / k + (pile % k > 0 ? 1 : 0)
        }
        return res
    }
}
