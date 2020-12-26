//
//  Maze.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 18/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public enum MazeTile: Equatable {
    case wall
    case entrance
    case key(Character)
    case door(Character)
    case empty
    
    var isKey: Bool { return key != nil }
    var isDoor: Bool { return door != nil }
    
    var key: Character? {
        guard case .key(let k) = self else { return nil }
        return k
    }
    
    var door: Character? {
        guard case .door(let d) = self else { return nil }
        return d
    }
    
    static let start = Position(x: 0, y: 0)
}
