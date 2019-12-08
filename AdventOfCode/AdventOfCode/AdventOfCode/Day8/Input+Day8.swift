//
//  Input+Day8.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 08/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

extension Input {
    static func day8(file: String) -> String {
        let data = Input.getInput(name: file)
        let string = String(decoding: data, as: UTF8.self)
        return string.replacingOccurrences(of: "\n", with: "")
    }
}
