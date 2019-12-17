//
//  Input+Day2.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 02/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public extension Input {
    static func day17(file: String) -> [Int:Int] {
        let data = Input.getInput(name: file)
        let string = String(decoding: data, as: UTF8.self)
        let array = string.components(separatedBy: ",")
        let list = array.compactMap { Int(String($0.replacingOccurrences(of: "\n", with: ""))) }
        
        var count = 0
        let dictionary = list.reduce([Int: Int]()) { (dict, value) -> [Int: Int] in
            var dict = dict
            dict[count] = value
            count += 1
            return dict
        }
        
        return dictionary
    }
}
