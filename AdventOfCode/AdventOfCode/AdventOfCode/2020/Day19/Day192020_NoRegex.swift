import Foundation
import Algorithms
import Regex

extension TwentyTwenty {
    public class Day19_NoRegex {
        public init() {
        }
        
        enum Rule {
            case char(Character)
            case composite([[Int]])
        }
    }
}

extension TwentyTwenty.Day19_NoRegex.Rule {
    init(_ line: String) {
        let char = line.replacingOccurrences(of: " \"a\"", with: "a").replacingOccurrences(of: " \"b\"", with: "b")
        if  char == "a" || char == "b" {
            self = .char(Character(char))
        } else {
            var parts: [[Int]] = []
            line
                .components(separatedBy: "|")
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .forEach { block in
                    let ints = block.components(separatedBy: " ").compactMap { Int($0) }
                    parts.append(ints)
                }
            self = .composite(parts)
        }
    }
}


extension TwentyTwenty.Day19_NoRegex {
    public func solvePart1(input: [String]) throws -> Int {
        let rules = input[0].components(separatedBy: "\n")
        let messages = input[1].components(separatedBy: "\n")
        
        var rulesDic: [Int: Rule] = [:]
        
        for rule in rules {
            let components = rule.components(separatedBy: ":")
            let ruleNumber = Int(components[0])!
            rulesDic[ruleNumber] = Rule(components[1])
        }
        
        let results = getOptions(rule: 0, rules: rulesDic, results: [""])
        return 0
    }
    
    public func solvePart2(input: [String]) throws -> Int {
        
        return 0
    }
    
    private func getOptions(rule: Int, rules: [Int: Rule], results: [String]) -> [String] {
        switch rules[rule] {
        case .char(let value):
            return results.map { result in
                result + String(value)
            }
        case .composite(let otherRules):
            var newResults : [String] = []
            var things: [String] = []
            otherRules.forEach { values in
                let this = values.map { getOptions(rule: $0, rules: rules, results: newResults) }
                this.forEach { (line) in
                    things.append(line.joined())
                }
            }
            
            things.forEach { (thing) in
                let new = results.map { $0 + thing }
                newResults += new
            }
            
            return newResults
        default:
            fatalError()
        }
    }
}
