//
//  Day17.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 17/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public class Day17 {
    
    let input: [Int: Int]
    
    public init(input: [Int: Int]) {
        self.input = input
    }
    
    public func part1() -> Int {
        let intcode = IntCode(list: input)
        intcode.calculate(inputs: [])
        
        let output = intcode.output.map { String(UnicodeScalar(UInt8($0))) }.reduce("", +).components(separatedBy: "\n")
        
        var dictionary = [Position: String]()
        let _ = output.enumerated().map { (yIndex, line) in
            line.enumerated().map { (xIndex, character) in
                let position = Position(x: xIndex, y: yIndex)
                dictionary[position] = String(character)
            }
        }
           
        return dictionary
            .compactMap { (key, value) -> Position? in
                if value == "#" {
                    var isIntersection = true
                    _ = Direction.allCases.map { direction in
                        let moved = key.move(vector: direction)
                        if dictionary[moved] != "#" {
                            isIntersection = false
                        }
                    }
                
                if isIntersection {
                    return key
                }
            }
            
            return nil
        }.map { position in
            position.x * position.y
        }.reduce(0, +)
    }
    
    public func part2() -> Int {
        
        // A, B, A, C, A, D, C, A, B, C
        
        // A=R12, R4, R10, R12
        // B=R6, L8, R10
        // C=C=l8, r4, r4, r6
        // D=r6, l8, r10
        
        let rules = """
            A,B,A,C,A,B,C,A,B,C
            R,12,R,4,R,10,R,12
            R,6,L,8,R,10
            L,8,R,4,R,4,R,6
            y\n
            """.utf8.map { Int($0) }
        
//        let mainFunction = [65, 44, 66, 44, 65, 44, 67, 44, 65, 44, 68, 44, 67, 44, 65, 44, 66, 44, 67, 10]
//        let A = [82, 44, 49, 50, 44, 82, 44, 52, 44, 82, 44, 49, 48, 44, 82, 44, 49, 50, 10]
//        let B = [82, 44, 54, 76, 56, 44, 82, 49, 48, 10]
//        let C = [76, 56, 44, 82, 52, 44, 82, 52, 44, 82, 54, 10]
//        let feed = [110, 10]
//        
        let intcode = IntCode(list: input)
        
        intcode.calculate(inputs: rules)
        
        let output = intcode.output.filter { $0 > 127 }
        return output.first!
    }
}
