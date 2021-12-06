//
//  LeetCode.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/3.
//

import Foundation

class LeetCode240 {
    /*
     该二维数组类似于一棵二分搜索树，对于每个数来说，左上方的数都小于它，右下方的数都大于它，所以把左下角作为根节点开始比较
     */
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var col = 0,row = matrix.count - 1
        while row >= 0 && col < matrix[0].count {
            if target > matrix[row][col] {
                col += 1
            }else if target < matrix[row][col] {
                row -= 1
            }else {
                return true
            }
        }
        return false
    }
}
