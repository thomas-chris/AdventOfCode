//
//  Input+Day16.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 16/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public extension Input {
    static func day16(file: String) -> [Int] {
        let data = Input.getInput(name: file)
        let string = String(decoding: data, as: UTF8.self)
        var array = [Int]()
        string.forEach { value in
            let string = String(value)
            if let number = Int(string) {
                array.append(number)
            }
        }
        return array
    }
}
