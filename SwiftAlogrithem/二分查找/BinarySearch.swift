//
//  BinarySearch.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/25.
//

import Foundation

class BinarySearch {
    static func search(_ nums: [Int], _ target: Int) -> Int {
        return search(data: nums, l: 0, r: nums.count - 1, target: target)
    }
    
    private static func search(data:[Int],l:Int,r:Int,target:Int) -> Int {
        if l > r { return -1 }
        
        let mid = l + (r - l) / 2
        
        if data[mid] == target { return mid }
        if data[mid] < target { return search(data: data, l: mid + 1, r: r, target: target)}
        
        return search(data: data, l:l, r: mid - 1, target: target)
    }
}
