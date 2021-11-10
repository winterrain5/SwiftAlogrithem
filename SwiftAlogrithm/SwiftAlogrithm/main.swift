//
//  main.swift
//  SwiftAlogrithm
//
//  Created by VICTOR03 on 2021/11/3.
//

import Foundation
let arr = ArrayGenerator.generateRandomArray(n: 10000, bound: 1000)
SortHelper.sortText(sortClass: InsertionSort(), arr: arr)


