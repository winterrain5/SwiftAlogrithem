//
//  MergeSort.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/18.
//

import Foundation
/*
 if l>=r return                     ------>  求解最基本的问题
 int mid =(1 + r)/2
 /对arr[L,mid]进行排序
 MergeSort(arr, l, mid)
 /对arr[mid+1,r]进行排序              ========》 把原问题转化成更小的问题
 MergeSort(arr, mid + 1, r)
 /将 arr(l,mid]和arr[mid+1,r]合并
 merge (arr, l, mid, r)
 */
// O(nlogn)
class MergeSort:Sortable {
    func sort<T>(arr: [T]) -> [T] where T : Comparable {
        guard arr.count > 1 else { return arr }    // 1
        
        let middleIndex = arr.count / 2              // 2
        
        let leftArray = sort(arr: Array(arr[0..<middleIndex]))             // 3
        
        let rightArray = sort(arr: Array(arr[middleIndex..<arr.count]))  // 4
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    
    
    /// 合并两个有序的空间 arr[l,mid],arr[mid+1,r]
    private func merge<T>(leftPile: [T], rightPile: [T]) -> [T] where T : Comparable {
        var leftIndex = 0
        var rightIndex = 0
        var orderedPile:[T] = []
        
        // 3
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex] )
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderedPile.append(rightPile[rightIndex] )
                rightIndex += 1
            } else {
                orderedPile.append(leftPile[leftIndex] )
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex] )
                rightIndex += 1
            }
        }
         
        // 4 左边数组还有未比较的数字
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex] )
            leftIndex += 1
        }
        // // 右边数组还有未比较的数字
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex] )
            rightIndex += 1
        }
        
        return orderedPile
    }
}
