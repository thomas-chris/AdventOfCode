//
//  Day11.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 11/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Day11 {
    
    let list: [Int]
    
    init(list: [Int]) {
        self.list = list
    }
    func part1(inputs: [Int]) -> Int {
        var count = 0
        let dictionary = list.reduce([Int: Int]()) { (dict, value) -> [Int: Int] in
            var dict = dict
            dict[count] = value
            count += 1
            return dict
        }
        let intCode = IntCode(list: dictionary)
        
        
        intCode.calculate(inputs: inputs)
        
        var paintingDictionary = [Position: Int]()
        var currentPosition = Position(x: 0, y: 0)
        var currentDirection: Direction = .up
        var loop = 0
        var output = intCode.output
        
        paintingDictionary[currentPosition] = output.first!
        currentDirection = rotate(for: output.last!, currentDirection: currentDirection)
        currentPosition = move(from: currentPosition, for: currentDirection)
        
        while !intCode.finished {
            intCode.calculate(inputs: [paintingDictionary[currentPosition] ?? 0])
            paintingDictionary[currentPosition] = output[0 + 2*loop]
            currentDirection = rotate(for: output[1 + 2*loop], currentDirection: currentDirection)
            currentPosition = move(from: currentPosition, for: currentDirection)
            output = intCode.output
            loop += 1
        }
    
        return paintingDictionary.count
    }
    
    func rotate(for rotation: Int, currentDirection: Direction) -> Direction {
        switch currentDirection {
            
        case .up:
            return rotation == 1 ? .right : .left
        case .right:
            return rotation == 1 ? .down : .up
        case .down:
            return rotation == 1 ? .left : .right
        case .left:
            return rotation == 1 ? .up : .down
        }
    }
    
    func move(from position: Position, for direction: Direction) -> Position {
        switch direction {
            
        case .up:
            return Position(x: position.x, y: position.y + 1)
        case .down:
            return Position(x: position.x, y: position.y - 1)
        case .left:
            return Position(x: position.x - 1, y: position.y)
        case .right:
            return Position(x: position.x + 1, y: position.y + 1)
        }
    }
}

