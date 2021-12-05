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
    
    func vector(_ newPostion: Position) -> [Position] {
        var positions = [Position]()
        let dx = (newPostion.x - self.x)
        let dy = (newPostion.y - self.y)
        
        var currentPostion = self
        
        if dx > 0 && dy > 0 {
            while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x + 1, y: currentPostion.y + 1)
            }
        } else if dx > 0 && dy < 0 {
            while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x + 1, y: currentPostion.y - 1)
            }
        } else if dx < 0 && dy > 0 {
            while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x - 1, y: currentPostion.y + 1)
            }
        } else if dx < 0 && dy < 0 {
            while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x - 1, y: currentPostion.y - 1)
            }
        } else if dx > 0 {
            while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x + 1, y: currentPostion.y)
            }
        } else if dx < 0 {
            while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x - 1, y: currentPostion.y)
            }
        } else if dy > 0 {
            while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x, y: currentPostion.y + 1)
            }
        } else if dy < 0 {
            while currentPostion != newPostion {
            positions.append(currentPostion)
            currentPostion = Position(x: currentPostion.x, y: currentPostion.y - 1)
            }
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
