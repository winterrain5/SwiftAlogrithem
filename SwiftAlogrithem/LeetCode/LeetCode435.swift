//
//  LeetCode435.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/9.
//

import Cocoa
// 无重叠子区间
class LeetCode435: NSObject {
    // 规定区间总有一个子区间
    static func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        return intervals.count - intervalSchedule(intervals)
    }
    
    // 计算有多少个不重叠的区间
    static func intervalSchedule(_ intervals:[[Int]]) -> Int {
        if intervals.count == 0 || intervals.count == 1 { return intervals.count }
        //排序 按照结束区间最小
        let sortIntvs = intervals.sorted { a, b in
            a[1] < b[1]
        }
        var count = 1 
        var x_end = sortIntvs[0][1] // 初始值
        for interval in sortIntvs {
            let start = interval[0]
            if start >= x_end {
                count += 1
                x_end = interval[1]
            }
        }
        return count
    }
}
