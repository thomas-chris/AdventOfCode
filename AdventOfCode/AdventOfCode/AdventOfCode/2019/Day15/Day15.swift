//
//  Day15.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 15/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public enum Day15Block: Int, CustomStringConvertible {
    public var description: String {
        switch self {
        case .empty:
            return "◼️"
        case .wall:
            return "◻️"
        case .oxygen:
            return "🤿"
        case .start:
            return "🤖"
        }
    }
    
    case wall = 0
    case empty = 1
    case oxygen = 2
    case start = 3
    
    
}

public class Day15 {
    
    let input: [Int: Int]
    var map = [Position: Day15Block]()
    
    public init(input: [Int: Int]) {
        self.input = input
    }
    
    public func part1() -> Int {
        
        let droid = Droid(computer: IntCode(list: input))
        let result = Direction.allCases
            .compactMap { findOxygen(droid: droid, direction: $0, map: &map) }
            .min() ?? Int.max
        print(printMap(map))
        return result
    }
    
    private func findOxygen(droid: Droid, direction: Direction, map: inout [Position: Day15Block]) -> Int? {
        var droid = Droid(computer: droid.computer.copy(), position: droid.position, tile: droid.tile, map: droid.map)
        droid.move(direction: direction)
        map.merge(droid.map) { (value, value2) -> Day15Block in
            return value
        }
        switch droid.tile {
        case .wall: return nil
        case .oxygen: return 1
        case .empty:
            return Direction.allCases
                .filter { $0 != direction.opposite }
                .compactMap { findOxygen(droid: droid, direction: $0, map: &map) }
                .min()
                .flatMap { $0 + 1 }
        case .start: return nil
        }
    }
    
    struct Droid {
        var computer: IntCode
        var position = Position.origin
        var tile = Day15Block.empty
        var map = [Position(x: 0, y: 0): Day15Block.start]
        
        mutating func move(direction: Direction) {
            let newPosition = position.move(vector: direction)
            computer.calculate(inputs: [direction.code])
            tile = Day15Block(rawValue: computer.output.last!)!
            map[newPosition] = tile
            if tile != .wall { position = newPosition }
        }
        
        
    }
    
    private func printMap(_ output: [Position:Day15Block]) -> String {
        let minimumX = output.reduce(0) { min($0,$1.key.x) }
        let minimumY = output.reduce(0) { min($0,$1.key.y) }
        let maximumX = output.reduce(0) { max($0,$1.key.x) }
        let maximumY = output.reduce(0) { max($0,$1.key.y) }
        var registration = ""
        for y in (0...maximumY-minimumY).reversed() {
            var row = ""
            for x in 0...maximumX - minimumX {
                let value = output[Position(x: x + minimumX, y: y + minimumY)] ?? .wall
                row += value.description
            }
            registration += row + "\n"
        }
        // GARPKZUL
        return registration
    }
    
}

extension Direction {
    fileprivate var code: Int {
        switch self {
        case .up: return 1
        case .down: return 2
        case .left: return 3
        case .right: return 4
        }
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
