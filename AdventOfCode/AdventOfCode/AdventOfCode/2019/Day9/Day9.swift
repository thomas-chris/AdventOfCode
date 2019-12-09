//
//  Day9.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 09/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Day9 {
    let list: [Int]
    
    init(list: [Int]) {
        self.list = list
    }
    
    func part1(inputs: [Int]) -> [Int] {
        var count = 0
        let dictionary = list.reduce([Int: Int]()) { (dict, value) -> [Int: Int] in
            var dict = dict
            dict[count] = value
            count += 1
            return dict
        }
        let intCode = IntCode2(list: dictionary)
        intCode.calculate(inputs: inputs)
        let output = intCode.output
        
        return output
    }
}
