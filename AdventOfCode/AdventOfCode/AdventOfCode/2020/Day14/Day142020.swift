import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day14 {
        public init() {
        }
        
        
        enum Instruction {
            case mask(zeros: [Int], ones: [Int])
            case memory(allocation: Int, value: Int)
            
            init(string: String) {
                if string.contains("mask =") {
                    let value = string.replacingOccurrences(of: "mask = ", with: "")
                    var zeros: [Int] = []
                    var ones: [Int] = []
                    
                    value.enumerated().forEach { index, character in
                        switch character {
                        case "0": zeros.append(index)
                        case "1": ones.append(index)
                        default: break
                        }
                    }
                    self = .mask(zeros: zeros, ones: ones)
                    return
                }
                
                if string.contains("mem[") {
                    let values = string.replacingOccurrences(of: "mem[", with: "").replacingOccurrences(of: "]", with: "").components(separatedBy: " = ")
                    self = .memory(allocation: Int(values[0])!, value: Int(values[1])!)
                    return
                }
                
                fatalError()
            }
        }
        
        enum Instruction2 {
            case mask(zeros: [Int], ones: [Int], exes: [Int])
            case memory(allocation: Int, value: Int)
            
            init(string: String) {
                if string.contains("mask =") {
                    let value = string.replacingOccurrences(of: "mask = ", with: "")
                    var zeros: [Int] = []
                    var ones: [Int] = []
                    var exes: [Int] = []
                    
                    value.enumerated().forEach { index, character in
                        switch character {
                        case "0": zeros.append(index)
                        case "1": ones.append(index)
                        case "X": exes.append(index)
                        default: break
                        }
                    }
                    self = .mask(zeros: zeros, ones: ones, exes: exes)
                    return
                }
                
                if string.contains("mem[") {
                    let values = string.replacingOccurrences(of: "mem[", with: "").replacingOccurrences(of: "]", with: "").components(separatedBy: " = ")
                    self = .memory(allocation: Int(values[0])!, value: Int(values[1])!)
                    return
                }
                
                fatalError()
            }
        }
    }
    
}

extension TwentyTwenty.Day14 {
    public func solvePart1(input: [String]) -> Int {
        let instructions = input.map { line in
            return Instruction(string: line)
        }
        
        var memory: [Int: Int] = [:]
        
        var zerosMask: [Int] = []
        var onesMask: [Int] = []
        
        instructions.forEach { instruction in
            
            if case .mask(let zeros, let ones) = instruction {
                zerosMask = zeros
                onesMask = ones
            }
            
            if case .memory(let allocation, value: let value) = instruction {
                let valueAsBinary = String(value, radix: 2)
                let paddedValue = String(repeating: "0", count: 36 - valueAsBinary.count) + valueAsBinary
                
                let zerosSwapped = paddedValue.enumerated().map { index, character -> String in
                    if zerosMask.contains(index) {
                        return "0"
                    } else {
                        return String(character)
                    }
                }.reduce("", +)
                
                
                let bothSwapped = zerosSwapped.enumerated().map { index, character -> String in
                    if onesMask.contains(index) {
                        return "1"
                    } else {
                        return String(character)
                    }
                    
                }.reduce("", +)
                
                memory[allocation] = Int(bothSwapped, radix: 2)
            }
        }
    
        return memory.values.reduce(0, +)
    }
    
    public func solvePart2(input: [String]) -> Int {
        let instructions = input.map { line in
            return Instruction2(string: line)
        }
        
        var memory: [Int: Int] = [:]
        
        var onesMask: [Int] = []
        var xMask: [Int] = []
        
        instructions.forEach { instruction in
            
            if case .mask(let _, let ones, let exes) = instruction {
                onesMask = ones
                xMask = exes
            }
            
            if case .memory(let allocation, value: let value) = instruction {
                let allocationAsBinary = String(allocation, radix: 2)
                let paddedValue = String(repeating: "0", count: 36 - allocationAsBinary.count) + allocationAsBinary
                
                let bothSwapped = paddedValue.enumerated().map { index, character -> String in
                    if onesMask.contains(index) {
                        return "1"
                    } else {
                        return String(character)
                    }
                    
                }.reduce("", +)
                
                let xSwapped = bothSwapped.enumerated().map { index, character -> String in
                    if xMask.contains(index) {
                        return "X"
                    } else {
                        return String(character)
                    }
                }.reduce("", +)
                
                let memoryAllocation = getAllValues(string: xSwapped, exes: xMask)
                
                for i in memoryAllocation {
                    memory[i] = value
                }
            }
        }
        
        return memory.values.reduce(0, +)
    }
    
    func getAllValues(string: String, exes: [Int]) -> [Int] {
        var values: [Int] = []
        let base = Int(string.replacingOccurrences(of: "X", with: "0"), radix: 2) ?? 0
        let iterations = Int("1" + String(repeating: "0", count: exes.count), radix: 2) ?? 0
                
        
        for i in 0..<iterations {
            let number = String(i, radix: 2)
            let binary = String(repeating: "0", count: exes.count - number.count) + number
            
            var result = Array(repeating: "0", count: 36)
            
            zip(binary, exes).forEach { (character, index) in
                result[index] = String(character)
            }
            let value = Int(result.joined(), radix: 2) ?? 0
            values.append(base + value)
        }
        return values
    }
}
