//
//  Input+Day2.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public extension Input {
    static func day7(file: String) -> [Int] {
        let data = Input.getInput(name: file)
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: ",")
        return array.compactMap { Int(String($0.replacingOccurrences(of: "\n", with: ""))) }
    }
}
