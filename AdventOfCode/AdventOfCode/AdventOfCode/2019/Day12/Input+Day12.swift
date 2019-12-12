//
//  Input+Day12.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 12/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

extension Input {
    static func day12(file: String) -> [XYZ] {
        let data = Input.getInput(name: file)
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: "\n")
                            .map { value in
                                String(value.replacingOccurrences(of: "<", with: "")
                                    .replacingOccurrences(of: ">", with: "")
                                    .replacingOccurrences(of: " ", with: ""))
                                .components(separatedBy: ",")
                            }
        let positions = array.compactMap { value -> XYZ? in
            guard value[0] != "" else { return nil }
            let x = Int(value[0].replacingOccurrences(of: "x=", with: ""))!
            let y = Int(value[1].replacingOccurrences(of: "y=", with: ""))!
            let z = Int(value[2].replacingOccurrences(of: "z=", with: ""))!
            return XYZ(x: x, y: y, z: z)
        }
        return positions
    }
}
