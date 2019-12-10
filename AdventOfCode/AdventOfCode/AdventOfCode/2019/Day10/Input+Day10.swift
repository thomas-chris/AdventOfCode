//
//  Input+Day10.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 10/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Position: Equatable, Hashable {
    let x: Int
    let y: Int
}

extension Input {
    static func day10(file: String) -> [Position] {
        let data = Input.getInput(name: file)
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: "\n")
        
        var result: [Position] = []
        
        array.enumerated().forEach { (yindex, rowString) in
            rowString.enumerated().forEach { (xindex, value) in
                if value == "#" {
                    result.append(Position(x: xindex, y: yindex))
                }
            }
        }
        return result
    }
}
