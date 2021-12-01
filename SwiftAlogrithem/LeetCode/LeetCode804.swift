//
//  LeetCode804.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/30.
//

import Foundation

class LeetCode804 {
    let codes = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        var set = Set<String>()
        for word in words {
            var result = ""
            for c in word.unicodeScalars {
                result.append(codes[Int(c.value) - 97])
            }
            set.insert(result)
        }
        return set.count
    }
}
