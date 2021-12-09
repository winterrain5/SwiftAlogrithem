//
//  LeetCode509.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/8.
//

import Cocoa

class LeetCode509: NSObject {
    /// dp数组 迭代算法 字底向上
    func fib(_ n: Int) -> Int {
        if n == 0 || n == 1{
            return n
        }
        var dp:[Int] = Array(repeating: 0, count: 21)
        // base case
        dp[0] = 0;dp[1] = 1
        
        for i in 2...n {
            // 状态转移方程
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
    
    func fib2(_ n: Int) -> Int {
        if n == 0 || n == 1{
            return n
        }
        var prve = 0,cur = 1
        
        for _ in 2...n {
            // 状态转移方程
            let sum = prve + cur
            prve = cur
            cur = sum
        }
        return cur
    }
}
