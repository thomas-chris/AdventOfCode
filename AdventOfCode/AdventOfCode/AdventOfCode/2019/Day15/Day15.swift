//
//  Day15.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 15/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public enum Day15Block {
    case wall
    case empty
    case oxygen
}

public class Day15 {
    
    let input: [Int: Int]
    var map = [Position: Day15Block]()
    var toDraw:[Int: [Int: Day15Block]] = [0:[0: .empty]]
    
    public init(input: [Int: Int]) {
        self.input = input
    }
    
    public func part1() {
//        let intCode = IntCode(list: input)
//        var notFound = true
//        while notFound {
//            intCode.calculate(inputs: <#T##[Int]#>)
//        }
//        
    }
    
}

//
//
//while !intCode.output.contains(2) {
//
//    mapCount = map.filter { (key, value) -> Bool in
//        value != .wall
//    }.count
//    instructions = [directionToMove.rawValue]
//    intCode.calculate(inputs: instructions)
//
//    let lastOutput = intCode.output.last
//    switch lastOutput {
//    case 0:
//        map[position.move(vector: directionToMove)] = .wall
//        switch directionToMove {
//        case .north:
//            directionToMove = .east
//        case .east:
//            directionToMove = .south
//        case .south:
//            directionToMove = .west
//        case .west:
//            directionToMove = .north
//        }
//    case 1:
//        map[position.move(vector: directionToMove)] = .empty
//        position = position.move(vector: CardinalDirection(rawValue: instructions.first!)!)
//        history[count] = CardinalDirection(rawValue: instructions.first!)!
//        count += 1
//    case 2:
//        map[position.move(vector: directionToMove)] = .oxygen
//        position = position.move(vector: CardinalDirection(rawValue: instructions.first!)!)
//        history[count] = CardinalDirection(rawValue: instructions.first!)!
//    count += 1
//    default:
//        fatalError()
//    }
//
//    if mapCount < (map.filter { (key, value) -> Bool in value != .wall }.count) {
//        distance += 1
//    }
//}
