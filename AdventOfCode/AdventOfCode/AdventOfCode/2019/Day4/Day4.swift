//
//  Day4.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 04/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public struct Day4 {
    public static func part1(passwordRange: PasswordRange) -> String {
        var validPasswords: [String] = []
        let range = Array(Int(passwordRange.start)!...Int(passwordRange.end)!)
        range.forEach { value in
            let isValid = validatePassword(String(value))
            if isValid {
                validPasswords.append(String(value))
            }
        }
        
        return String(validPasswords.count)
    }
    
    public static func part2(passwordRange: PasswordRange) -> String {
        var validPasswords: [String] = []
        let range = Array(Int(passwordRange.start)!...Int(passwordRange.end)!)
        range.forEach { value in
            let isValid = validatePart2(String(value))
            if isValid {
                validPasswords.append(String(value))
            }
        }
        
        return String(validPasswords.count)
        
    }
    
    public static func validatePassword(_ option: String) -> Bool {
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
    
    public static func validatePart2(_ option: String) -> Bool {
       var hasPair = false
        let array = option.compactMap { $0.wholeNumberValue }
        guard array == array.sorted() else { return false }
        var ignoreCharacter: Int? = nil
        array.enumerated()
            .forEach { (index, value) in
                if ignoreCharacter != value,
                    index + 1 <= array.count - 1,
                    value == array[index + 1] {
                    if index + 2 <= array.count-1, value == array[index+2] {
                        ignoreCharacter = value
                    } else {
                        hasPair = true
                    }
                   
                }
            }
        
        return hasPair
        
        
    }
    
    public struct Key: Hashable {
        let x: Int
        let y: Int
    }
}
