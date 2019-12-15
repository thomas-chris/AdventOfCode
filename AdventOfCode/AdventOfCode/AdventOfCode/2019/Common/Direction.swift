//
//  Direction.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 11/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public enum Direction: String, CaseIterable {
    case up = "U"
    case down = "D"
    case left = "L"
    case right = "R"
    
    public var opposite: Direction {
        switch self {
        case .up:
            return .down
        case .down:
            return .up
        case .left:
            return .right
        case .right:
            return .left
            
        }
    }
}

public enum CardinalDirection: CaseIterable {
    case north
    case east
    case south
    case west
}
