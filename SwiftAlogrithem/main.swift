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
    
    
}

func testSelectK() {
    var arr = [3,2,6,4,7]
    let result = SelectK.findKthLargest(nums: &arr, k: 3)
    print("findKthLargest: \(result)")
    let result1 = SelectK.getLeastNums(arr: &arr, k: 2)
    print("getLeastNums: \(result1)")
}

func testBinarySearch() {
    var arr = ArrayGenerator.generateRandomArray(n: 10000, bound: 10000)
    QuickSort2().quickSort(arr: &arr)
    let start2 = CFAbsoluteTimeGetCurrent()
    let result = BinarySearch2.search(arr, 10)
    let end2 = CFAbsoluteTimeGetCurrent()
    let duration2 = end2 - start2
    print("执行时间2：\(duration2)")
    print(result)
}

func testShipDays() {
    let arr = [1,2,3,4,5,6,7,8,9,10]
    let start2 = CFAbsoluteTimeGetCurrent()
    let result = LeetCode1011().shipWithinDays(arr, 5)
    let end2 = CFAbsoluteTimeGetCurrent()
    let duration2 = end2 - start2
    print("执行时间2：\(duration2) result \(result)")
    
    let a = 9 / 2
    print(a)
}

func testBST() {
    let bst = BST<Int>()
    let nums = [5,3,6,8,4,2]
    nums.forEach { n in
        bst.add(n)
    }

    bst.preOrder ()
    print("\n")
//    let min = bst.removeMin()
//    print(min)
    bst.remove(3)
    print(bst)
   
}

func testLeetCode804() {
    let result = LeetCode804().uniqueMorseRepresentations(["gin", "zen", "gig", "msg"])
    print(result)
}

func testHeapSort() {
    let arr = ArrayGenerator.generateRandomArray(n: 1000000, bound: 100000)
    SortHelper.sortText(sortClass: HeapSort(), arr: arr)
}

func testBubbleSort() {
    let arr = ArrayGenerator.generateRandomArray(n: 10000, bound: 10000)
    SortHelper.sortText(sortClass: BubbleSort(), arr: arr)
}

func testShellSort() {
    let arr = ArrayGenerator.generateRandomArray(n: 100000, bound: 100000)
    SortHelper.sortText(sortClass: ShellSort(), arr: arr)
    
//    SortHelper.sortText(sortClass:InsertionSort(), arr: arr)
}

func testSegmentTree() {
//    LeetCode().isPalindrome("A man, a plan, a canal: Panama")
    let nums = [1, 2, 3, 4]
    let sumSegmentTree = SegmentTree(array: nums, leftBound: 0, rightBound: nums.count - 1, function: +)
    let a = sumSegmentTree.query(withLeftBound: 0, rightBound: 3)  // 1 + 2 + 3 + 4 = 10
    let b = sumSegmentTree.query(withLeftBound: 1, rightBound: 2)  // 2 + 3 = 5
    let c = sumSegmentTree.query(withLeftBound: 0, rightBound: 0)  // just 1
    let d = sumSegmentTree.query(withLeftBound: 3, rightBound: 3)  // just 4
    
    print(a,b,c,d)
}

func testTrie() {
    let word = ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
    let trie = Trie();
    trie.insert(word: "apple");
//    let a = trie.search("apple");   // 返回 True
//    let b = trie.search("app");     // 返回 False
//    let c = trie.startsWith("app"); // 返回 True
//    trie.insert("app");
//    let d = trie.search("app");  // 返回 True
    
}

func testLeetCode() {
    print(LeetCode516.longestPalindromeSubseq("bbbab"))
}
testLeetCode()
