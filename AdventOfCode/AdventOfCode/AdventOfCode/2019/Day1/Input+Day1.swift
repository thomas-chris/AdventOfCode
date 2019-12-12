//
//  Input+Day1.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public extension Input {
    static func day1Input() -> [Double] {
        let data = Input.getInput(name: "Day1")
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: "\n")
        return array.compactMap { Double($0) }
    }
}
