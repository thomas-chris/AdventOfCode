//
//  IntCode.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 07/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public class IntCode {
    public var list: [Int: Int]
    public var output: [Int]
    var index: Int
    var finished: Bool
    var variableInputs: [Int]
    var relativeBase: Int

    public func calculate(inputs: [Int]) {
        
        variableInputs = inputs
        
        while (list[index]! % 100) != 99 {
            let initialOperatorValue = list[index]!
            
//            var opCodeString = String(initialOperatorValue)
            
            let c = initialOperatorValue % 10000 % 1000 / 100
            let b = initialOperatorValue % 10000 / 1000
            let a = initialOperatorValue / 10000
            
            let param0Mode = Mode(rawValue: Int(c))!
            let param1Mode = Mode(rawValue: Int(b))!
            let param2Mode = Mode(rawValue: Int(a))!
            
            switch initialOperatorValue % 100 {
            case 1:
                let value0 = parameters(list: list, index: index + 1, mode: param0Mode, relativeBase: relativeBase)
                let value1 = parameters(list: list, index: index + 2, mode: param1Mode, relativeBase: relativeBase)
                let toWrite = writeIndex(list: list, index: index + 3, mode: param2Mode, relativeBase: relativeBase)
                list[toWrite] =  value0 + value1
                index += 4
            case 2:
                let value0 = parameters(list: list, index: index + 1, mode: param0Mode, relativeBase: relativeBase)
                let value1 = parameters(list: list, index: index + 2, mode: param1Mode, relativeBase: relativeBase)
                let toWrite = writeIndex(list: list, index: index + 3, mode: param2Mode, relativeBase: relativeBase)
                list[toWrite] =  value0 * value1
                index += 4
            case 3:
                if variableInputs.isEmpty {
                    return
                } else {
                    switch param0Mode {
                    case .relative:
                        list[relativeBase + list[index+1]!] = variableInputs.removeFirst()
                    case .position:
                        list[list[index+1]!] = variableInputs.removeFirst()
                    case .immediate:
                        list[index+1] = variableInputs.removeFirst()
                    }
                    
                    index += 2
                }
            case 4:
                let value0 = parameters(list: list, index: index + 1, mode: param0Mode, relativeBase: relativeBase)
                
                output.append(value0)
                index += 2
            case 5: // jump-if-true
                let value0 = parameters(list: list, index: index + 1, mode: param0Mode, relativeBase: relativeBase)
                let value1 = parameters(list: list, index: index + 2, mode: param1Mode, relativeBase: relativeBase)
                
                if value0 != 0 {
                    index = value1
                } else {
                    index += 3
                }
            case 6:
                let value0 = parameters(list: list, index: index + 1, mode: param0Mode, relativeBase: relativeBase)
                let value1 = parameters(list: list, index: index + 2, mode: param1Mode, relativeBase: relativeBase)
                if value0 == 0 {
                    index = value1
                } else {
                    index += 3
                }
            case 7:
                let value0 = parameters(list: list, index: index + 1, mode: param0Mode, relativeBase: relativeBase)
                let value1 = parameters(list: list, index: index + 2, mode: param1Mode, relativeBase: relativeBase)
                let toWrite = writeIndex(list: list, index: index + 3, mode: param2Mode, relativeBase: relativeBase)
                list[toWrite] = value0 < value1 ? 1 : 0
                index += 4
            case 8:
                let value0 = parameters(list: list, index: index + 1, mode: param0Mode, relativeBase: relativeBase)
                let value1 = parameters(list: list, index: index + 2, mode: param1Mode, relativeBase: relativeBase)
                let toWrite = writeIndex(list: list, index: index + 3, mode: param2Mode, relativeBase: relativeBase)
                list[toWrite] = value0 == value1 ? 1 : 0
                index += 4
            case 9:
                let value0 = parameters(list: list, index: index + 1, mode: param0Mode, relativeBase: relativeBase)
                relativeBase += value0
                index += 2
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
    
    public func parameters(list: [Int: Int], index: Int, mode: Mode, relativeBase: Int) -> Int {
        switch mode {
        case .immediate:
            return list[index] ?? 0
        case .position:
            return list[list[index] ?? 0] ?? 0
        case .relative:
            return list[relativeBase + (list[index] ?? 0)] ?? 0
        }
        
    }
    
    public func writeIndex(list: [Int: Int], index: Int, mode: Mode, relativeBase: Int) -> Int {
        switch mode {
        case .immediate:
            return index
        case .position:
            return list[index] ?? 0
        case .relative:
            return relativeBase + (list[index] ?? 0)
        }
    }
    
    public func copy() -> IntCode {
        IntCode(list: list, output: output, index: index, finished: finished, variableInputs: variableInputs, relativeBase: relativeBase)
    }
    
    public init(list: [Int: Int], output: [Int] = [], index: Int = 0, finished: Bool = false, variableInputs: [Int] = [], relativeBase: Int = 0) {
        self.list = list
        self.output = output
        self.index = index
        self.finished = finished
        self.variableInputs = variableInputs
        self.relativeBase = relativeBase
    }
}

public enum Mode: Int {
    case position = 0
    case immediate = 1
    case relative = 2
}
