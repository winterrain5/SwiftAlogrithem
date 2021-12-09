//
//  UnionFind.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/7.
//

import Cocoa

class UnionFind:UF {
    
    
    private var parent:[Int] = []
    private var rank:[Int] = [] // rank[i]表示以i为根的集合中元素层数数
    init(_ size:Int) {
        for i in 0..<size {
            parent[i] = i
            rank[i] = 1
        }
        // 每一个节点都指向自己，即每一个节点都是一颗树
    }
   
    // 查找元素P对应的集合编号
    // 0(h)
    private func find(_ p:Int) -> Int{
        if p < 0 || p > parent.count - 1 {
            fatalError()
        }
//        var result = p
//        while result != parent[p] { //一直找到根节点
//            parent[p] = parent[parent[p]] // 路径压缩
//            result = parent[p]
//        }
//        return result
        
        if p != parent[p] {
            parent[p] = find(parent[p])
        }
        return parent[p]
    }
    
    func getSize() -> Int {
        return parent.count
    }
    
    // 查找元素p和q是否所属同一个集合
    // O(h)
    func isConnected(_ p: Int, _ q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    func unionElements(_ p: Int, _ q: Int) {
        
        let pRoot = find(p)
        let qRoot = find(q)
        
        if pRoot == qRoot {
            return
        }
        
        // 将rank低的集合合并到rank高的集合上
        if rank[pRoot] < rank[qRoot] {
            parent[pRoot] = qRoot
        }else if rank[pRoot] > rank[qRoot]{
            parent[qRoot] = pRoot
        }else {
            parent[qRoot] = pRoot
            rank[pRoot] += 1
        }
        
    }
}
