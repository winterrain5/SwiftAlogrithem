//
//  Sortable.swift
//  SwiftAlogrithm
//
//  Created by VICTOR03 on 2021/11/3.
//

import Foundation

protocol Sortable {
    @discardableResult
    func sort<T:Comparable>(arr:[T]) -> [T]
}
