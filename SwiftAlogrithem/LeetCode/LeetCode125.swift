//
//  LeetCode.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/3.
//

import Cocoa

class LeetCode125 {
    func isPalindrome(_ s: String) -> Bool {
            var i = 0, j = s.count - 1
            let sChars = Array(s.lowercased())
            
            while i < j {
                while !sChars[i].isValid && i < j {
                    i += 1
                }
                
                while !sChars[j].isValid && i < j {
                    j -= 1
                }
                
                if sChars[i] != sChars[j] {
                    return false
                } else {
                    i += 1
                    j -= 1
                }
            }
            return true
        }
}

extension Character {
    var isValid: Bool {
        return isLetter || isNumber
    }
}
