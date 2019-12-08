//
//  IntCode.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 07/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

class IntCode {
    var list: [Int]
    var output = [Int]()
    var index = 0
    var finished = false
    var wait = false
    var variableInputs: [Int] = []
    
    init(list: [Int]) {
        self.list = list
    }
    
    func append(input: Int) {
        variableInputs.append(input)
        wait = false
        
        while !wait {
            
        }
        
        return
    }
    
    func calculate(inputs: [Int]) {
        
        variableInputs = inputs
        
        while (list[index] % 100) != 99 {
            let initialOperatorValue = list[index]
            
            switch initialOperatorValue % 100 {
            case 1:
                let values = parameters(list: list, count: 2, index: index + 1, opcode: initialOperatorValue)
                list[list[index+3]] =  values[0] + values[1]
                index += 4
            case 2:
                let values = parameters(list: list, count: 2, index: index + 1, opcode: initialOperatorValue)
                list[list[index+3]] =  values[0] * values[1]
                index += 4
            case 3:
                if variableInputs.isEmpty {
                    wait = true
                    return
                } else {
                    list[list[index+1]] = variableInputs.removeFirst()
                    index += 2
                    
                }
            case 4:
                let values = parameters(list: list, count: 1, index: index + 1, opcode: initialOperatorValue)
                output.append(values[0])
                index += 2
            case 5: // jump-if-true
                let values = parameters(list: list, count: 2, index: index + 1, opcode: initialOperatorValue)
                if values[0] != 0 {
                    index = values[1]
                } else {
                    index += 3
                }
            case 6:
                let values = parameters(list: list, count: 2, index: index + 1, opcode: initialOperatorValue)
                if values[0] == 0 {
                    index = values[1]
                } else {
                    index += 3
                }
            case 7:
                let values = parameters(list: list, count: 2, index: index + 1, opcode: initialOperatorValue)
                list[list[index+3]] = values[0] < values[1] ? 1 : 0
                index += 4
            case 8:
                let values = parameters(list: list, count: 2, index: index + 1, opcode: initialOperatorValue)
                list[list[index+3]] = values[0] == values[1] ? 1 : 0
                index += 4
            case 99:
                finished = true
                return
            default:
                break
            }
        }
        finished = true
        return
    }
    
    func parameters(list: [Int], count: Int, index: Int, opcode: Int) -> [Int] {
        
        let array = Array(list[index..<(index+count)])
        let list = array.enumerated()
            .map { tuple -> Int in
                let (position, element) = tuple
                let power = position + 2
                let div = (pow(10, power) as NSDecimalNumber).intValue
                return ((opcode / div) % 10 ) == 1 ? element : list[element]
        }
        
        return list
    }
}
