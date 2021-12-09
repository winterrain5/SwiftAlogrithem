//
//  LeetCode516.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/9.
//

import Cocoa
/// 最长回文子串
class LeetCode516: NSObject {
    static func longestPalindromeSubseq(_ s: String) -> Int {
        let n = s.count
        if n == 1 || n == 0 { return n }
        let sChars = Array(s.lowercased())
        // 初始化全为0
        var dp:[[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        // base case 即只有一个元素的情况 长度为1
        for i in 0..<n {
            dp[i][i] = 1
        }
        for i in (0...n-2).reversed() {
            for j in i+1..<n {
                if sChars[i] == sChars[j] {
                    dp[i][j] = dp[i+1][j-1] + 2
                }else {
                    dp[i][j] = max(dp[i][j-1], dp[i+1][j])
                }
            }
        }
        // 右上角位置即为最长子串长度
        return dp[0][n-1]
    }
}
