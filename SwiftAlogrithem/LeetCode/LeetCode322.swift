//
//  LeetCode322.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/8.
//

import Cocoa
// 自顶向下的解法
class LeetCode322: NSObject {
    // 备忘录记录重复计算
    var memo:[Int]!
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        memo = Array.init(repeating: -666, count: amount + 1)
        return dp(coins: coins, amount: amount)
    }
    // coins = [1,2,5] amount = 11
    func dp(coins:[Int],amount:Int) -> Int {
        if amount == 0 { return 0 }
        if amount < 0 { return -1 }
        
        // 查询备忘录 防止重复计算
        if memo[amount] != -666 {
            return memo[amount]
        }
        
        var res = Int.max
        for coin in coins {
            // 计算子问题的结果
            let subResult = dp(coins: coins, amount: amount - coin)
            // 子问题无解
            if subResult == -1 { continue }
            res = min(res, subResult + 1)
        }
        // 结果存入备忘录
        memo[amount] = res == Int.max ? -1 : res
        return memo[amount]
    }
}

class LeetCode322_2: NSObject {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        // 取最小值 所以初始值设为最大
        var dp:[Int] = Array.init(repeating: amount + 1, count: amount + 1)
        dp[0] = 0 // base case
        // 对于数组中的每一枚硬币来讲，拿出这枚硬币再加上剩余金额所需要的硬币数，在其中选择出最少的那个硬币数
        for i in 0...amount {
            
            for coin in coins { // 遍历coins.count次 每次都dp[i]更新，取出最小值 即min(F(i-c1),F(i-c2),F(i-c3))再加1 即为某个子问题的解
                // 子问题无解
                if i - coin < 0 { continue }
                dp[i] = min(dp[i], dp[i-coin] + 1)
            }
        }
        // 循环结束后 判断amount对应的解是否有正确的解
        return dp[amount] > amount ? -1 : dp[amount];
    }
}
