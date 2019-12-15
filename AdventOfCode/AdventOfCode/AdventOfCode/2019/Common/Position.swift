//
//  Position.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 11/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public struct Position: Equatable, Hashable {
    let x: Int
    let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func move(vector: CardinalDirection) -> Position {
        switch vector {
        case .north:
            return Position(x: self.x, y: self.y + 1)
        case .east:
            return Position(x: self.x + 1, y: self.y)
        case .south:
            return Position(x: self.x, y: self.y - 1)
        case .west:
            return Position(x: self.x - 1, y: self.y)
        }
    }
}

public struct XYZ: Equatable, Hashable {
    let x: Int
    let y: Int
    let z: Int
    
    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public static let zero = XYZ(x: 0, y: 0, z: 0)
    
    public var energy: Int {
        abs(x) + abs(y) + abs(z)
    }
}
