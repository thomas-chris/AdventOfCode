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
    
    public static var origin: Position {
        return Position(x: 0, y: 0)
    }
    
    func move(vector: Direction) -> Position {
        switch vector {
        case .up:
            return Position(x: self.x, y: self.y + 1)
        case .right:
            return Position(x: self.x + 1, y: self.y)
        case .down:
            return Position(x: self.x, y: self.y - 1)
        case .left:
            return Position(x: self.x - 1, y: self.y)
        }
    }
    
    /// currently only does +1,-1 in any direction...
    func vector(_ newPostion: Position) -> [Position] {
        var positions = [Position]()
        let dx = (newPostion.x - self.x) / abs(gcd(newPostion.y - self.y, newPostion.x - self.x))
        let dy = (newPostion.y - self.y) / abs(gcd(newPostion.y - self.y, newPostion.x - self.x))
        
        var currentPostion = self
        while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x + dx, y: currentPostion.y + dy)
        }
        
        positions.append(newPostion)
        return positions
    }
}

extension Position {
    var matrix: [Position] {
        
        [(Position(x: self.x - 1, y: self.y - 1)),
         (Position(x: self.x - 1, y: self.y)),
         (Position(x: self.x - 1, y: self.y + 1)),
         (Position(x: self.x, y: self.y - 1)),
         (Position(x: self.x, y: self.y + 1)),
         (Position(x: self.x + 1, y: self.y - 1)),
         (Position(x: self.x + 1, y: self.y)),
         (Position(x: self.x + 1, y: self.y + 1)),
        ]
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
