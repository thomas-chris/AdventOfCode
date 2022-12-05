import Algorithms
import Foundation
import Regex
import UIKit

public struct Day14 {
    
    public static func part1(_ input: [String], turns: Int) -> Int {

        let parsed = parse(input)
        let pairs = parsed.0.pairs()
        var counted = [String: Int]()
        
        for pair in pairs {
            counted["\(pair.0)\(pair.1)", default: 0] += 1
        }
        
        for _ in 0..<turns {
            counted = createPolymer(counted, rules: parsed.1)
        }
        
        let firstChar = parsed.0.first!
        let lastChar = parsed.0.last!

        var charactercounts = [Character: Int]()
        
        for (key, value) in counted {
            for character in key {
                charactercounts[character, default: 0] += value
            }
        }
        
        charactercounts[firstChar, default: 0] += 1
        charactercounts[lastChar, default: 0] += 1

        charactercounts = charactercounts.mapValues { value in
            value / 2
        }

        return charactercounts.values.max()! - charactercounts.values.min()!
    }
    
    public static func part2(_ input: [String]) -> Int {
        return 1
    }
    
    private static func parse(_ input: [String]) -> (String, [String: String]) {
        let polymer = input.first!
        var rules = [String: String]()
        input.dropFirst(2).forEach { string  in
            let split = string.components(separatedBy: " -> ")
            rules[split[0]] = split[1]
        }
        
        return (polymer, rules)
    }
    
    private static func createPolymer(_ counted: [String: Int], rules: [String: String]) -> [String: Int] {
        var newCounts = [String: Int]()
        for (key, value) in counted {
            let rule = rules[key]!
            
            let newPair1 = "\(key.first!)\(rule)"
            let newPair2 = "\(rule)\(key.last!)"
            
            newCounts[newPair1, default: 0] += value
            newCounts[newPair2, default: 0] += value
        }
        
        return newCounts
    }
    
}
