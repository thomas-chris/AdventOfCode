//
//  Input+Day4.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 04/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct PasswordRange {
    let start: String
    let end: String
}

extension Input {
    static func day4(file: String) -> PasswordRange {
        let data = Input.getInput(name: file)
        var string = String(decoding: data, as: UTF8.self)
        let trimmed = string.trimmingCharacters(in: CharacterSet(charactersIn: "\n"))
        let array = trimmed.components(separatedBy: "-")
        guard
            let start = array.first,
            let end = array.last
        else {
            return PasswordRange(start: "000000", end: "999999")
        }
        return PasswordRange(start: start, end: end)
    }
}
