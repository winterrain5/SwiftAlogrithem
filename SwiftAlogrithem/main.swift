//
//  main.swift
//  SwiftAlogrithm
//
//  Created by VICTOR03 on 2021/11/3.
//

import Foundation

func testInsertionSort() {
    let arr = ArrayGenerator.generateRandomArray(n: 1000, bound: 1000)
    SortHelper.sortText(sortClass: InsertionSort(), arr: arr)
}

func testValidParenttheses() {
    let str1 = "()[]{}"
    let result1 = LeetCode20.isValid(str: str1)

    let str2 = "([}])"
    let result2 = LeetCode20.isValid(str: str2)
    print("result1:\(result1) result2:\(result2)")
}

func testLinklist() {
    let linklist = LinkList<Int>()
    for i in 0..<5 {
        linklist.addFirst(i)
        print(linklist)
    }
    
    linklist.add(at: 2, 666)
    print(linklist)
    
    linklist.remove(at: 2)
    print(linklist)
    
    linklist.removeLast()
    print(linklist)
    
    linklist.removeFirst()
    print(linklist)
}

func testLinkListStack() {
    let stack = LinkListStack<Int>()
    for i in 0..<5 {
        stack.push(i)
        print(stack)
    }
    stack.pop()
    print(stack)
}

func testLinkListQueue() {
    let queue = LinkListQueue<Int>()
    for i in 0..<10 {
        queue.enqueue(i)
        print(queue)
        
        if i % 3 == 2 {
            queue.dequeue()
            print(queue)
        }
    }
}

func testLeetCode206() {
    let head = ListNode(1)
    let next1 = ListNode(2)
    let next2 = ListNode(3)
    let next3 = ListNode(4)
    let tail = ListNode(5)
    
    head.next = next1
    next1.next = next2
    next2.next = next3
    next3.next = tail
    
    let result = LeetCode206.reverseList2(head: head)
    
}

func testMergeSort() {
    let arr = ArrayGenerator.generateRandomArray(n: 10000, bound: 100000)
    SortHelper.sortText(sortClass: MergeSort(), arr: arr)
}

func textLeetCode51() {
    let arr = [7,5,6,4]
    print("\(LeetCode51().reversePairs(arr))")
    
}

func testQuickSort() {
  
    var arr = ArrayGenerator.generateRandomArray(n: 5000000, bound: 10000)
    let start = CFAbsoluteTimeGetCurrent()
    QuickSort().quickSort(arr: &arr)
    let end = CFAbsoluteTimeGetCurrent()
    let duration = end - start
    print("执行时间：\(duration)")
    
    let start1 = CFAbsoluteTimeGetCurrent()
    QuickSort2().quickSort(arr: &arr)
    let end1 = CFAbsoluteTimeGetCurrent()
    let duration1 = end1 - start1
    print("执行时间1：\(duration1)")
    
    let start2 = CFAbsoluteTimeGetCurrent()
    QuickSort3().quickSort(arr: &arr)
    let end2 = CFAbsoluteTimeGetCurrent()
    let duration2 = end2 - start2
    print("执行时间2：\(duration2)")
}

func testSelectK() {
    var arr = [3,2,6,4,7]
    let result = SelectK.findKthLargest(nums: &arr, k: 3)
    print("findKthLargest: \(result)")
    
    let result1 = SelectK.getLeastNums(arr: &arr, k: 2)
    print("getLeastNums: \(result1)")
}
testSelectK()
