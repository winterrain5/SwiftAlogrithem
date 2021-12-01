//
//  LeetCode1011.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/25.
//

import Foundation

class LeetCode1011 {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var l = weights.max() ?? 0 // 最低的运载能力应该是货物中最大的值，否则最大的值永远无法运走
        var r = weights.reduce(0, { $0 + $1 }) // 最大的运载能力是所有货物的总和，这样一天就可以运走
        while l < r {
            let mid = l + (r - l) / 2
            //如果传送带运载能力是mid,运完货物需要的天数小于等于D
            //那么mid就是一个可能的解,但是,我们还要找,看有没有更小的解
            //所以,调整右边界, r= mid
            //注意,mid要包含在搜索范图里,因为mid是问题的解
            if self.days(weights, mid) <= days {
                r = mid
            }else {
                l = mid + 1
            }
        }
        return l
        
    }
    
    func days(_ weights:[Int],_ k:Int) -> Int {
        var cur = 0,res = 0
        for weight in weights {
            /// 如果当前重量加上weight小于等于K 则加上weight
            if cur + weight <= k {
                cur += weight
            }else {
                res += 1
                cur = weight
            }
        }
        res += 1 // 遍历结束 cur 等于最后一个元素 也就是最后一个元素需要一天运输
        return res
    }
}
