//
//  Input+Day6.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 06/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct OrbitPair {
    let orbiter: String
    let center: String
    
    init?(orbiter: String, center: String) {
        if orbiter == "" || center == "" {
            return nil
        } else {
            self.orbiter = orbiter
            self.center = center
        }
    }
}

extension Input {
    static func day6(file: String) -> [OrbitPair] {
        let data = Input.getInput(name: file)
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: "\n")
        return array.compactMap { string -> OrbitPair? in
            let pair = String(string).components(separatedBy: ")")
            return OrbitPair(orbiter: String(pair.last!), center: String(pair.first!))
        }
    }
}
