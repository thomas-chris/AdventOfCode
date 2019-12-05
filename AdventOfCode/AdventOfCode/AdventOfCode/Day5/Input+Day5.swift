//
//  Input+Day2.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

extension Input {
    static func day5() -> [Int] {
        let data = Input.getInput(name: "Day5")
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: ",")
        return array.compactMap { Int($0) }
    }
}