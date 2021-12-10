import Algorithms
import Foundation
import Regex
import UIKit

public struct Day10 {
    public enum Status: Equatable {
        case valid
        case invalid(Character)
        case incomplete([Character])
    }
    
    public static func part1(_ input: [String]) -> Int {
        let scores = [
            Character(")"): 3,
            Character("]"): 57,
            Character("}"): 1197,
            Character(">"): 25137
        ]
        
        var score = 0
        for line in input {
            switch parse(line) {
            case .valid: break
            case .incomplete(_): break
            case .invalid(let character):
                score += scores[character] ?? 0
            }
        }
        
        return score
    }
    
    public static func part2(_ input: [String]) throws -> Int {
        let scores = [
            Character("("): 1,
            Character("["): 2,
            Character("{"): 3,
            Character("<"): 4
        ]
        
        let totalScores = input
            .compactMap { line -> [Character]? in
                switch parse(line) {
                    case .incomplete(let incomplete): return incomplete
                    default: return nil
                }
            }
            .map { incomplete -> Int in
                var score = 0
                var remaining = incomplete
                while !remaining.isEmpty {
                    score *= 5
                    score += scores[remaining.removeLast()] ?? 0
                }
                return score
            }
        
        return totalScores.sorted()[totalScores.count / 2]
    }
    
    public static func parse(_ line: String) -> Status {
        var foundCharacters = [Character]()
        
        for characrer in line {
            if foundCharacters.isEmpty {
                foundCharacters.append(characrer)
            } else if
                foundCharacters.last == "(" && characrer == ")" ||
                    foundCharacters.last == "[" && characrer == "]" ||
                    foundCharacters.last == "{" && characrer == "}" ||
                    foundCharacters.last == "<" && characrer == ">" {
                foundCharacters.removeLast()
            } else if
                ["(", "[", "{", "<"].contains(foundCharacters.last)
                    && ["(", "[", "{", "<"].contains(characrer) {
                foundCharacters.append(characrer)
            } else if
                foundCharacters.last == "(" && ["]", "}", ">"].contains(characrer) ||
                    foundCharacters.last == "[" && [")", "}", ">"].contains(characrer) ||
                    foundCharacters.last == "{" && [")", "]", ">"].contains(characrer) ||
                    foundCharacters.last == "<" && [")", "]", "}"].contains(characrer) {
                return .invalid(characrer)
            }
        }
        
        return foundCharacters.isEmpty ? .valid : .incomplete(foundCharacters)
    }
}
