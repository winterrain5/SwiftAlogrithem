//
//  UF.swift
//  SwiftAlogrithem
//
//  Created by Derrick on 2021/12/7.
//

import Cocoa

protocol UF  {
    func getSize() -> Int
    
    func isConnected(_ p:Int,_ q:Int) -> Bool
    
    func unionElements(_ p:Int,_ q:Int)
}
