//
//  ValidParenttheses.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/11.
//

import Cocoa
/// 括号匹配
class ValidParenttheses {

    static func  isValid(str:String) -> Bool {
        var stack:[Character] = []
        for c in str {
            if c == "(" || c == "[" || c == "{" {
                stack.append(c)
            }else {
                if stack.isEmpty {
                    return false
                }
                let topChar = stack.popLast()
                if c == ")" && topChar != "(" {
                    return false
                }
                if c == "]" && topChar != "[" {
                    return false
                }
                if c == "}" && topChar != "{" {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
