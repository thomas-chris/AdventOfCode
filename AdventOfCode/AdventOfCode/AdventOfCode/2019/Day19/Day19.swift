//
//  Day19.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 20/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public class Day19 {
    let input: [Int: Int]
    
    public init(input: [Int: Int]) {
        self.input = input
    }
    
    enum Robot: Int {
        case stationary = 0
        case pulled = 1
    }

    public func part1() -> Int {
        var robotPositions = [Position: Robot]()
        
        for y in 0..<50 {
            for x in 0..<50 {
                robotPositions[Position(x: x, y: y)] = getRobotStatus(input: input, position: Position(x: x, y: y))
            }
        }
        
        let positions = robotPositions.compactMap { (key, value) -> Position? in
            if value == .pulled {
                return key
            }
            return nil
        }
        
        return positions.count
        
    }
    
    public func part2() -> Int {
        
        let start = Position(x: 0, y: 0)
        
        var searchedX = Set<Int>()
        var positions = [start]
        
        while let position = positions.first {
            positions.removeFirst()
            let droneValue = getRobotStatus(input: input, position: position)
            let searched = searchedX.contains(position.x)
            
            switch (droneValue, searched) {
            case (.pulled, true):
                positions.append(position.move(vector: .right))
            case (.pulled, false):
                searchedX.insert(position.x)
                positions.append(position.move(vector: .right))
            case (.stationary, true):
                positions.append(position.move(vector: .right))
            case (.stationary, false):
                searchedX.insert(position.x)
                positions.append(position.move(vector: .up))
            }
            
            if getRobotStatus(input: input, position: Position(x: position.x - 99 , y: position.y + 99)) == .pulled &&
                getRobotStatus(input: input, position: Position(x: position.x - 99, y: position.y)) == .pulled &&
                getRobotStatus(input: input, position: Position(x: position.x, y: position.y)) == .pulled {
                
                return (position.x - 99) * 10000 + position.y
            }


        }
        
        return Int.min
    }
    
    private func getRobotStatus(input: [Int: Int], position: Position) -> Robot {
        let intCode = IntCode(list: input)
        intCode.calculate(inputs: [position.x, position.y])
        return Robot(rawValue: intCode.output.last!)!
    }
}
