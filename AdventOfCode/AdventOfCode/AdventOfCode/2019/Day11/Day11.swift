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
    
        let panels = paint(list: dictionary, initialInputs: inputs)
        return panels.count
    }
    
    func part2(inputs: [Int]) {
        var count = 0
        let dictionary = list.reduce([Int: Int]()) { (dict, value) -> [Int: Int] in
            var dict = dict
            dict[count] = value
            count += 1
            return dict
        }
    
        let panels = paint(list: dictionary, initialInputs: inputs)
        
        let registration = printRegistration(panels)
        
        print(registration)
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
            return Position(x: position.x + 1, y: position.y)
        }
    }
    
    func paint(list: [Int: Int], initialInputs: [Int]) -> [Position: Int] {
        
        let intCode = IntCode(list: list)
        var paintingDictionary = [Position: Int]()
        var currentPosition = Position(x: 0, y: 0)
        var currentDirection: Direction = .up
        var loop = 0
        var inputs: [Int] = initialInputs
        var output = [Int]()
        while !intCode.finished {
            intCode.calculate(inputs: inputs)
            output = intCode.output
            paintingDictionary[currentPosition] = output[0 + 2*loop]
            currentDirection = rotate(for: output[1 + 2*loop], currentDirection: currentDirection)
            currentPosition = move(from: currentPosition, for: currentDirection)
            inputs = [paintingDictionary[currentPosition] ?? 0]
            
            loop += 1
        }
        
        return paintingDictionary
    }
    
    func printRegistration(_ output: [Position:Int]) -> String {
        let minimumX = output.reduce(0) { min($0,$1.key.x) }
        let minimumY = output.reduce(0) { min($0,$1.key.y) }
        let maximumX = output.reduce(0) { max($0,$1.key.x) }
        let maximumY = output.reduce(0) { max($0,$1.key.y) }
        var registration = ""
        for y in (0...maximumY-minimumY).reversed() {
            var row = ""
            for x in 0...maximumX - minimumX {
                let value = output[Position(x: x + minimumX, y: y + minimumY)] ?? 0
                if value == 1 {
                    row += "◻️"
                } else {
                    row += "◼️"
                }
            }
            registration += row + "\n"
        }
        // GARPKZUL
        return registration
    }
}

