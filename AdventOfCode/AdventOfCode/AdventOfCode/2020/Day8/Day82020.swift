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
        print(input)
        let instructions = input.compactMap { line -> TwentyTwenty.Instruction? in
            let components = line.components(separatedBy: " ")
            guard let type = TwentyTwenty.Instruction.InstructionType(rawValue: components[0]),
                  let value = Int(components[1]) else {
                print("type: \(TwentyTwenty.Instruction.InstructionType(rawValue: components[0])), value: \(Int(components[1]))")
                return nil
            }
            return TwentyTwenty.Instruction(type: type, value: value)
        }
        
        var accumalator = 0
        var visited: Set<Int> = []
        var index = 0
        
        while !visited.contains(index) {
            visited.insert(index)
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
        
        return accumalator
    }
    
}
