//
//  File.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/11/25.
//

import Foundation

class BST<E>:CustomStringConvertible where E:Comparable,E : CustomStringConvertible {
    class Node:Equatable {
        static func == (lhs: BST<E>.Node, rhs: BST<E>.Node) -> Bool {
            lhs.e == rhs.e
        }
        
        var e:E?
        var left:Node?
        var right:Node?
        init(_ e:E) {
            self.e = e
        }
    }
    var root:Node?
    var size:Int = 0
    
    var isEmpty:Bool { size == 0 } 
    
    func add(_ e:E) {
        root = add(root, e)
    }
    
    // 向以node为根的二分搜索树中插入元素E，递归算法
    private func add(_ node:Node?,_ e:E) -> Node?{
        
        // 递归终止条件
        // 返回插入新节点后二分搜索树的根
        if node == nil {
            size += 1
            return Node(e)
        }
        guard let parentE = node?.e else { return nil }
        if e < parentE {
            node?.left = add(node?.left,e)
        }else if e > parentE {
            node?.right = add(node?.right, e)
        }
        
        return node
    }
    
    func contains(_ e:E) -> Bool {
        return contains(root,e)
    }
    
    // 以Node为根的二分搜索树中是否包含元素e 
    private func contains(_ node:Node?,_ e:E) -> Bool {
        guard let node = node,let nodeE = node.e  else { return false}
        
        if e == nodeE {
            return true
        }
        else if e < nodeE { //
            return contains(node.left, e)
        }
        else {
            return contains(node.right, e)
        }
    }
    /// 非递归实现前序遍历 深度优先遍历
    func preOrderNR() {
        let stack = LinkListStack<Node>()
        guard let root = root else {
            return
        }
        stack.push(root)
        while !stack.isEmpty() {
            let cur = stack.pop()
            print(cur?.e?.description ?? "")
            
            if cur?.right != nil {
                stack.push((cur?.right)!)
            }
            if cur?.left != nil {
                stack.push((cur?.left)!)
            }
        }
    }
    
    // 二分搜索树的前序遍历 深度优先遍历
    func preOrder() {
        preOrder(root)
    }
    // 以Node为根的二分搜索树的前序遍历
    private func preOrder(_ node:Node?) {
        guard let node = node,let e = node.e else { return }
        
        print(e) // 相当于根节点
        preOrder(node.left)
        preOrder(node.right)
    }
    
    func inOrder() {
        inOrder(root)
    }
    private func inOrder(_ node:Node?) {
        guard let node = node,let e = node.e else { return }
        
        inOrder(node.left)
        print(e) // 相当于根节点
        inOrder(node.right)
    }
    
    func postOrder() {
        postOrder(root)
    }
    private func postOrder(_ node:Node?) {
        guard let node = node,let e = node.e else { return }
        
        postOrder(node.left)
        postOrder(node.right)
        print(e) // 相当于根节点
    }
    
    /// 层序遍历 即 广度优先遍历
    func levelOrder() {
        let queue = LinkListQueue<Node>()
        guard let root = root else { return }
        queue.enqueue(root)
        
        while !queue.isEmpty() {
            let cur = queue.dequeue()
            print(cur?.e?.description ?? "")
            
            if cur?.left != nil {
                queue.enqueue((cur?.left)!)
            }
            
            if cur?.right != nil {
                queue.enqueue((cur?.right)!)
            }
            
        }
        
    }
    /// 最小节点
    public func minmun() -> E {
        if size == 0 {
            assertionFailure("BST is Empty")
        }
        
        return (minimum(root).e)!
    }
    
    private func minimum(_ node:Node?) -> Node {
        if node?.left == nil {
            return node!
        }
        return minimum(node?.left)
    }
    
    /// 最大节点
    public func maxmun() -> E? {
        if size == 0 {
            assertionFailure("BST is Empty")
        }
        return maxmun(root)?.e
    }
    
    private func maxmun(_ node:Node?) -> Node? {
        if node?.right == nil {
            return node
        }
        return maxmun(node?.right)
    }
    
    public func removeMin() -> E? {
        let ret = minmun()
        root = removeMin(root)
        return ret
    }
    
    /// 删除以node为根的二分搜索树的最小节点
    /// 返回删除节点后的新的二分搜索树的根
    private func removeMin(_ node:Node?) -> Node? {
        if node?.left == nil {
            let rightNode = node?.right
            node?.right = nil
            size -= 1
            return rightNode
        }
        node?.left = removeMin(node?.left)
        return node
    }
    
    public func removeMax() -> E? {
        let ret = maxmun()
        root = removeMax(root)
        return ret
    }
    
    /// 删除以node为根的二分搜索树的最大节点
    /// 返回删除节点后的新的二分搜索树的根
    private func removeMax(_ node:Node?) -> Node? {
        if node?.right == nil {
            let leftNode = node?.left
            node?.left = nil
            size -= 1
            return leftNode
        }
        node?.right = removeMax(node?.right)
        return node
    }
    
    public func remove(_ e:E) {
        root = remove(root, e)
    }
    
    /// 删除以node为根的二分搜索树中值为e的节点
    /// 返回删除节点后的二分搜索树的根
    private func remove(_ node:Node?,_ e:E) -> Node? {
        guard let node = node,let nodeE = node.e else { return node }
        
        if e < nodeE { // 要删除的元素小于当前节点 继续在左子树中中找到待删除的元素
            node.left = remove(node.left, e)
            return node
        } else if e > nodeE {
            node.right = remove(node.right, e)
            return node
        } else { // e == nodeE
            
            if node.left == nil {
                let rightNode = node.right
                node.right = nil
                size -= 1
                return rightNode
            }
            
            if node.right == nil {
                let leftNode = node.left
                node.left = nil
                size -= 1
                return leftNode
            }
            
            // 待删除节点左右子树均不为空的情况
            // 找到比待删除节点大的最小的节点，即待删除节点右子树的最小节点
            // 用这个节点顶替待删除节点的位置
            let successor = minimum(node.right)
            successor.right = removeMin(node.right)
            successor.left = node.left
            
            node.left = nil
            node.right = nil
            
            return successor
        }
    }
    
    
    /// 生成node为根节点，深度为depth的描述二叉树的字符串
    private func generateBSTString(node:Node?,depth:Int,result:inout String) {
        if node == nil {
            result.append(generateDepthString(depth: depth) + "null\n")
            return
        }
        
        result.append(generateDepthString(depth: depth) + (node?.e?.description ?? "") + "\n")
        generateBSTString(node: node?.left, depth: depth + 1, result: &result)
        generateBSTString(node: node?.right, depth: depth + 1, result: &result)
    }
    private func generateDepthString(depth:Int) -> String {
        var result = ""
        for _ in 0..<depth {
            result.append("-")
        }
        return result
    }
    
    var description: String {
        var result = ""
        generateBSTString(node: root, depth: 0, result: &result)
        return result
    }
    
    
}
