////
////  Day2.swift
////  AdventOfCode
////
////  Created by Chris Thomas on 02/12/2019.
////  Copyright © 2019 Chris Thomas. All rights reserved.
////
//
import Foundation

public struct Day5 {
    public static func calculate(list: [Int], inputs: [Int]) -> Int {
        
        var result = list
        
        var output = 0
        var index = 0
        var iteration = 0
        
        while (result[index] % 100) != 99 {
            
            let initialOperatorValue = result[index]
            
            switch initialOperatorValue % 100 {
            case 1:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                result[result[index+3]] =  values[0] + values[1]
                index += 4
            case 2:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                result[result[index+3]] =  values[0] * values[1]
                index += 4
            case 3:
                result[result[index+1]] = inputs[iteration]
                iteration += 1
                
                index += 2
            case 4:
                let values = parameters(result: result, count: 1, index: index + 1, opcode: initialOperatorValue)
                output = values[0]
                index += 2
            case 5: // jump-if-true
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                if values[0] != 0 {
                    index = values[1]
                } else {
                    index += 3
                }
            case 6:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                if values[0] == 0 {
                    index = values[1]
                } else {
                    index += 3
                }
            case 7:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                result[result[index+3]] = values[0] < values[1] ? 1 : 0
                index += 4
            case 8:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                result[result[index+3]] = values[0] == values[1] ? 1 : 0
                index += 4
            case 99:
                return output
            default:
                break
            }
        }
        return output
    }
    
    public static func parameters(result: [Int], count: Int, index: Int, opcode: Int) -> [Int] {
        
        let array = Array(result[index..<(index+count)])
        let result = array.enumerated()
            .map { tuple -> Int in
                let (position, element) = tuple
                let power = position + 2
                let div = (pow(10, power) as NSDecimalNumber).intValue
                return ((opcode / div) % 10 ) == 1 ? element : result[element]
        }
        
        return result
    }
    
}

public extension Day5 {
    public static func calculateForFeedback(list: [Int], inputs: [Int], output: Int = 0) -> (Int, [Int]) {
        
        var inputs = inputs
        var result = list
        
        var output = 0
        var index = 0
        var iteration = 0
        
        while (result[index] % 100) != 99 {
            
            let initialOperatorValue = result[index]
            
            switch initialOperatorValue % 100 {
            case 1:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                result[result[index+3]] =  values[0] + values[1]
                index += 4
            case 2:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                result[result[index+3]] =  values[0] * values[1]
                index += 4
            case 3:
                if inputs.isEmpty {
                    index -= 1
                    return (output, result)
                }
                result[result[index+1]] = inputs.removeFirst()
                iteration += 1
                
                index += 2
            case 4:
                let values = parameters(result: result, count: 1, index: index + 1, opcode: initialOperatorValue)
                output = values[0]
                index += 2
            case 5: // jump-if-true
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                if values[0] != 0 {
                    index = values[1]
                } else {
                    index += 3
                }
            case 6:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                if values[0] == 0 {
                    index = values[1]
                } else {
                    index += 3
                }
            case 7:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                result[result[index+3]] = values[0] < values[1] ? 1 : 0
                index += 4
            case 8:
                let values = parameters(result: result, count: 2, index: index + 1, opcode: initialOperatorValue)
                result[result[index+3]] = values[0] == values[1] ? 1 : 0
                index += 4
            case 99:
                return (output, result)
            default:
                break
            }
        }
        return (output, result)
    }
}
