//
//  Direction.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 11/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public enum Direction: String {
    case up = "U"
    case down = "D"
    case left = "L"
    case right = "R"
}

public enum CardinalDirection: Int, CaseIterable {
    case north = 1
    case east = 2
    case south = 3
    case west = 4
}
