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


testLinkListStack()
