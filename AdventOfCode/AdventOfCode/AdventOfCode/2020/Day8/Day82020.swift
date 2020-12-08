import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day8 {
        public init() {}
    }
    
    struct Instruction {
        
        enum InstructionType: String {
            case acc
            case jmp
            case nop
        }
        
        let type: TwentyTwenty.Instruction.InstructionType
        let value: Int
    }
    
    
    
}

extension TwentyTwenty.Day8  {
    
    public func solve1(input: [String]) -> Int {
        let instructions = formatInput(input: input)
        var result = 0
        runGame(with: instructions, accumalator: &result)
        return result
    }
    
    public func solve2(input: [String]) -> Int {
        let instructions = formatInput(input: input)
        var result = 0
        
        for indexToChange in 0..<instructions.count {
            
            var newInstructions = instructions
            let instruction = instructions[indexToChange]
            if instruction.type != .acc {
                
                switch instruction.type {
                case .nop: newInstructions[indexToChange] = TwentyTwenty.Instruction(type: .jmp, value: instruction.value)
                case .jmp: newInstructions[indexToChange] = TwentyTwenty.Instruction(type: .nop, value: instruction.value)
                default: continue
                }
            }
            var accumalator = 0
            let completed = runGame(with: newInstructions, accumalator: &accumalator)
            
            if completed {
                result = accumalator
                break
            }
            
        }
        
        return result
    }
    
    private func formatInput(input: [String]) -> [TwentyTwenty.Instruction] {
        input.compactMap { line -> TwentyTwenty.Instruction? in
            let components = line.components(separatedBy: " ")
            guard let type = TwentyTwenty.Instruction.InstructionType(rawValue: components[0]),
                  let value = Int(components[1]) else {
                return nil
            }
            return TwentyTwenty.Instruction(type: type, value: value)
        }
    }
    
    private func runGame(with instructions: [TwentyTwenty.Instruction], accumalator: inout Int) -> Bool {
        
        var visited: Set<Int> = []
        var index = 0
        var completed = false
        while !visited.contains(index) {
            visited.insert(index)
            if index >= instructions.count {
                completed = true
                return completed
            }
            let instruction = instructions[index]
            
            switch instruction.type {
            case .acc:
                accumalator += instruction.value
                index += 1
            case .nop:
                index += 1
            case .jmp:
                index += instruction.value
            }
            
        }
        return completed
    }
}
