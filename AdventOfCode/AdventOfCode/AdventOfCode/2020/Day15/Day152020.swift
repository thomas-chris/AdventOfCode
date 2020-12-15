import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day15 {
        public init() {
        }
        
        struct TurnAndSpoken {
            let lastSpokenValue: Int
            let previousLastSpokenValue: Int
        }
    }
    
}

extension TwentyTwenty.Day15 {
    public func solvePart1(input: [Int]) -> Int {
        let times = 2020
        var turnForNumber: [Int: TurnAndSpoken] = [:]
        var turn = 0
        
        let defaultValue = TurnAndSpoken(lastSpokenValue: -1, previousLastSpokenValue: -1)
        
        var lastNumberSpoken = 0
        for value in input {
            turn += 1
            turnForNumber[value] = TurnAndSpoken(lastSpokenValue: turn, previousLastSpokenValue: -1)
            lastNumberSpoken = value
        }
        
        while turn < times {
            turn += 1
            let value = turnForNumber[lastNumberSpoken] ?? defaultValue
            if value.lastSpokenValue >= 0 && value.previousLastSpokenValue >= 0 {
                lastNumberSpoken = value.lastSpokenValue - value.previousLastSpokenValue
            } else {
                lastNumberSpoken = 0
            }
            let newValue = turnForNumber[lastNumberSpoken] ?? defaultValue
            turnForNumber[lastNumberSpoken] = TurnAndSpoken(lastSpokenValue: turn, previousLastSpokenValue: newValue.lastSpokenValue)
        }
        return lastNumberSpoken
    }
    
    public func solvePart2(input: [Int]) -> Int {
        let times = 30000000
        var turnForNumber: [Int: TurnAndSpoken] = [:]
        var turn = 0
        
        let defaultValue = TurnAndSpoken(lastSpokenValue: -1, previousLastSpokenValue: -1)
        
        var lastNumberSpoken = 0
        for value in input {
            turn += 1
            turnForNumber[value] = TurnAndSpoken(lastSpokenValue: turn, previousLastSpokenValue: -1)
            lastNumberSpoken = value
        }
        
        while turn < times {
            turn += 1
            let value = turnForNumber[lastNumberSpoken] ?? defaultValue
            if value.lastSpokenValue >= 0 && value.previousLastSpokenValue >= 0 {
                lastNumberSpoken = value.lastSpokenValue - value.previousLastSpokenValue
            } else {
                lastNumberSpoken = 0
            }
            let newValue = turnForNumber[lastNumberSpoken] ?? defaultValue
            turnForNumber[lastNumberSpoken] = TurnAndSpoken(lastSpokenValue: turn, previousLastSpokenValue: newValue.lastSpokenValue)
        }
        return lastNumberSpoken
    }
}
