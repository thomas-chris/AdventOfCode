//
//  IntCode.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 07/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

class IntCode {
    var list: [Int: Int]
        var output = [Int]()
        var index = 0
        var finished = false
        var wait = false
        var variableInputs: [Int] = []
        var relativeBase = 0
        
        init(list: [Int: Int]) {
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
            
            while (list[index]! % 100) != 99 {
                let initialOperatorValue = list[index]!
                
                var opCodeString = String(initialOperatorValue)
                let e = opCodeString.count > 0 ? String(opCodeString.removeLast()) : ""
                let d = opCodeString.count > 0 ? String(opCodeString.removeLast()) : ""
                let c = opCodeString.count > 0 ? String(opCodeString.removeLast()) : ""
                let b = opCodeString.count > 0 ? String(opCodeString.removeLast()) : ""
                let a = opCodeString.count > 0 ? String(opCodeString.removeLast()) : ""
                
                let param0Mode = Mode(rawValue: Int(c) ?? 0)!
                let param1Mode = Mode(rawValue: Int(b) ?? 0)!
                let param2Mode = Mode(rawValue: Int(a) ?? 0)!
                
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
                        wait = true
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
        
        func parameters(list: [Int: Int], index: Int, mode: Mode, relativeBase: Int) -> Int {
            switch mode {
            case .immediate:
                return list[index] ?? 0
            case .position:
                return list[list[index] ?? 0] ?? 0
            case .relative:
                return list[relativeBase + (list[index] ?? 0)] ?? 0
            }
            
        }
        
        func writeIndex(list: [Int: Int], index: Int, mode: Mode, relativeBase: Int) -> Int {
            switch mode {
            case .immediate:
                return index
            case .position:
                return list[index] ?? 0
            case .relative:
                return relativeBase + (list[index] ?? 0)
            }
        }
    }

    enum Mode: Int {
        case position = 0
        case immediate = 1
        case relative = 2
    }
