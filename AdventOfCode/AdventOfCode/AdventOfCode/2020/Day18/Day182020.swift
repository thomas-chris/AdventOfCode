import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day18 {
        public init() {
        }
        
        let operators: [String:(Int,Int)->Int] = [
            "+": (+),
//            "-": (-),
//            "/": (/),
            "*": (*),
        ]
    }
    
    
}

extension TwentyTwenty.Day18 {
    public func solvePart1(input: [String]) -> Int {
        
        var sums = [Int]()
        
        for line in input {
            let last = breakUpLine(string: line, solve: solveBlock)
            let result = solveBlock(string: last)
            sums.append(result)
        }
        
        return(sums.reduce(0, +))
    }
    
    public func solvePart2(input: [String]) -> Int {
        var sums = [Int]()
        
        for line in input {
            let last = breakUpLine(string: line, solve: solveBlock2)
            let result = solveBlock2(string: last)
            sums.append(result)
        }
        
        return(sums.reduce(0, +))
    }
    
    private func breakUpLine(string: String, solve: (String) -> Int) -> String {
        
        var smallestBlock = ""
        var newString = string
        
        for character in string {
            if character == "(" {
                smallestBlock = ""
            } else if character == ")" {
                let replacement = solve(smallestBlock)
                newString = string.replacingOccurrences(of: "(\(smallestBlock))", with: String(replacement))
                newString = breakUpLine(string: newString, solve: solve)
                return newString
            } else {
                smallestBlock += String(character)
            }
        }
        
        return newString
    }
    
    private func solveBlock(string: String) -> Int {
        
        let characters = string.components(separatedBy: " ")
        var lastInt = 0
        var useOperator: ((Int, Int) -> Int)? = nil
        
        for character in characters {
            if let int = Int(character) {
                if useOperator == nil {
                    lastInt = int
                } else {
                    lastInt = useOperator!(lastInt, int)
                    useOperator = nil
                }
            } else if ["*", "+", "/", "-"].contains(character) {
                useOperator = operators[character]
            }
        }
        
        return lastInt
    }
    
    private func solveBlock2(string: String) -> Int {
        let sums = string.components(separatedBy: " * ")
        var thingsToMultiply = [Int]()
        for list in sums {
            let chunks = list.components(separatedBy: " ")
            var lastInt = 0
            var useOperator: ((Int, Int) -> Int)? = nil
            
            for character in chunks {
                if let int = Int(String(character)) {
                    if useOperator == nil {
                        lastInt = int
                    } else {
                        lastInt = useOperator!(lastInt, int)
                        useOperator = nil
                    }
                } else if ["*", "+", "/", "-"].contains(character) {
                    useOperator = operators[String(character)]
                }
            }
            thingsToMultiply.append(lastInt)
        }
        
        return thingsToMultiply.reduce(1, *)
    }
}
