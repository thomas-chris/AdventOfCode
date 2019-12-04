//
//  Day4.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 04/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

struct Day4 {
    static func part1(passwordRange: PasswordRange) -> String {
        
        var totalNumberValidPasswords: String = "000000"
        
        var validPasswords: [String] = []
        let range = Array(Int(passwordRange.start)!...Int(passwordRange.end)!)
        range.map { value in
            let isValid = validatePassword(String(value))
            if isValid {
                validPasswords.append(String(value))
            }
        }
        
        return String(validPasswords.count)
    }
    
    static func validatePassword(_ option: String) -> Bool {
        var hasPair = false
        var neverDecreases = true
        let array = option.compactMap { $0.wholeNumberValue }
        array.enumerated().forEach { (index, value) in
            if index + 1 <= array.count - 1 {
                if value == array[index + 1] {
                    hasPair = true
                } else if value > array[index + 1] {
                    neverDecreases = false
                }
            }
        }
        
        return hasPair && neverDecreases
    }
    
//    static func validatePart2(_ option: String) -> Bool {
//        
//    }
}
