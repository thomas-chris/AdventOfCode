//
//  Input+Day3.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 03/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

typealias Day3Input = [Double: (direction: Direction, distance: Double)]

enum Direction: String {
    case up = "U"
    case down = "D"
    case left = "L"
    case right = "R"
}

extension Input {
    static func day3Input(file: String) -> (path1: [Double: (direction: Direction, distance: Double)], path2: [Double: (direction: Direction, distance: Double)]) {
        let data = Input.getInput(name: file)
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: "\n")
        
        let path1 = array[0].components(separatedBy: ",").getDay3Data()
        let path2 = array[1].components(separatedBy: ",").getDay3Data()
        
        return (path1: path1, path2: path2)
    }
}

extension Array where Element == String {
    func getDay3Data() -> [Double: (direction: Direction, distance: Double)] {
        var index = 0
        return self.reduce(into: [Double: (direction: Direction, distance: Double)]()) {
            let directionString = String($1.prefix(1))
            
            guard
                let direction = Direction(rawValue: directionString),
                let distance = Double($1.dropFirst())
            else {
                return
            }
            $0[Double(index)] = (direction: direction, distance: distance)
            index += 1
        }
        
    }
}
