//
//  Merger.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/6.
//

import Cocoa

protocol Merger {
    func merge<T:Comparable>(a:T,b:T) -> T
}
