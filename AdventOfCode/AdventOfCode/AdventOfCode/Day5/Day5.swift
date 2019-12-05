////
////  Day2.swift
////  AdventOfCode
////
////  Created by Chris Thomas on 02/12/2019.
////  Copyright © 2019 Chris Thomas. All rights reserved.
////
//
import Foundation

struct Day5 {
    static func calculate(list: [Int], input: Int) -> Int {

        var result = list
        var index = 0
    
        var value = input
        while result[index] != 99 {

            let initialOperatorValue = result[index]
            var operatorValue = initialOperatorValue
            var modes = [0,0,0]
            if initialOperatorValue > 99 {
                operatorValue = initialOperatorValue % 100
                let stringValue = String(initialOperatorValue)
                let string = String(stringValue.reversed().dropFirst().dropFirst())
                var temp: [Int] = []
                string.forEach{ value in
                    temp.append(Int(String(value))!)
                }
                while temp.count != 3 {
                    temp.append(0)
                }
                modes = temp
            }

            switch operatorValue {
            case 1:
                result[result[index+3]] = (modes[0] == 0 ? result[result[index+1]] : result[index+1]) + (modes[1] == 0 ? result[result[index+2]] : result[index+2])
                index += 4
            case 2:
                result[result[index+3]] = (modes[0] == 0 ? result[result[index+1]] : result[index+1]) * (modes[1] == 0 ? result[result[index+2]] : result[index+2])
                index += 4
            case 3:
                if modes.first == 0 {
                    result[result[index + 1]] = value
                } else {
                    result[index+1] = value
                }
                index += 2
            case 4:
                if modes.first == 0 { value = result[result[index+1]] } else { value = result[index+1] }
                index += 2
            default:
                break
            }
        }

        return value
    }

}

