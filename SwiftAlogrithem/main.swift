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
    let result1 = ValidParenttheses.isValid(str: str1)

    let str2 = "([}])"
    let result2 = ValidParenttheses.isValid(str: str2)
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
    let arr = ArrayGenerator.generateRandomArray(n: 100000, bound: 100000)
    SortHelper.sortText(sortClass: MergeSort(), arr: arr)
}


testMergeSort()
