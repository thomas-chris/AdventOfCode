//
//  Position.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 11/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Position: Equatable, Hashable {
    let x: Int
    let y: Int
}

struct XYZ: Equatable, Hashable {
    let x: Int
    let y: Int
    let z: Int
    
    static let zero = XYZ(x: 0, y: 0, z: 0)
    
    var energy: Int {
        abs(x) + abs(y) + abs(z)
    }
}
