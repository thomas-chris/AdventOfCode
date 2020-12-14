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
                let paddedValue = pad(string: valueAsBinary, toSize: 36)
                
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
    
    func pad(string : String, toSize: Int) -> String {
      var padded = string
      for _ in 0..<(toSize - string.count) {
        padded = "0" + padded
      }
        return padded
    }
    public func solvePart2(input: [String]) {
        
    }
}
