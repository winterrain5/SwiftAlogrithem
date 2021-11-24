//
//  ArrayGenerator.swift
//  SwiftAlogrithm
//
//  Created by VICTOR03 on 2021/11/3.
//

import Foundation

class ArrayGenerator {
    private init(){}
    
    static func generateRandomArray(n:Int,bound:Int) -> [Int]{
        var array:[Int] = []
        for _ in 0..<n {
            let random = Int(arc4random())%bound + 1
            array.append(Int(random))
        }
        return array
    }
    
    static func generateOrderdArray(n:Int) -> [Int] {
        var array:[Int] = []
        for i in 0...n {
            array.append(i)
        }
        return array
    }
}
