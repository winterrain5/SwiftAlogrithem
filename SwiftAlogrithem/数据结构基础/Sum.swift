//
//  Sum.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/16.
//

import Foundation

class Sum {
    public static func sum(arr:[Int]) -> Int {
        sum(arr: arr, location: 0)
    }
    
    /// 计算arr[location...n)这个区间的所有数字和
    private static func sum(arr:[Int],location:Int) -> Int {
        if location == arr.count {
            return 0
        }
        return arr[location] + sum(arr: arr, location: location + 1)
    }
}
