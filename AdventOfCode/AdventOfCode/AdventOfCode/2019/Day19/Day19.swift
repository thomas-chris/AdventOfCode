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
    
    enum Drone: Int {
        case stationary = 0
        case pulled = 1
    }

    public func part1() -> Int {
        var dronePositions = [Position: Drone]()
        
        for y in 0..<50 {
            for x in 0..<50 {
                dronePositions[Position(x: x, y: y)] = drone(input: input, position: Position(x: x, y: y))
            }
        }
        
        return dronePositions.compactMap { (key, value) -> Position? in
            if value == .pulled {
                return key
            }
            return nil
        }.count
        
    }
    
    private func drone(input: [Int: Int], position: Position) -> Drone {
        let intCode = IntCode(list: input)
        intCode.calculate(inputs: [position.x, position.y])
        return Drone(rawValue: intCode.output.last!)!
    }


}
