import Foundation
import Algorithms
import Regex

extension TwentyTwenty {
    public class Day19 {
        public init() {
        }
        
        enum Rule {
            case single(String)
            case sequence([Int])
            case either([Int], [Int])
        }
        
        func rawRules(input: [String]) -> [Int: Rule] {
            
            /// The input can only have 2s in sequence, despite what the example says
            
            let single = Regex(#""(.)""#)
            let one = Regex(#"(\d+)"#)
            let sequence1 = Regex(#"(\d+) (\d+)"#)
            let sequence2 = Regex(#"(\d+) (\d+) (\d+)"#)
            let either1 = Regex(#"(\d+) \| (\d+)"#)
            let either2 = Regex(#"(\d+) (\d+) \| (\d+) (\d+)"#)
            
            var rawRules: [Int: Rule] = [:]
            for line in input {
                if line.isEmpty { break }
                let split = line.components(separatedBy: ":")
                let number = split[0]
                let int = Int(number)!
                let remainder = split[1].trimmingCharacters(in: .whitespaces)
                
                let rule: Rule
                if let captures = either2.firstMatch(in: remainder)?.captures {
                    rule = .either([Int(captures[0]!)!, Int(captures[1]!)!], [Int(captures[2]!)!, Int(captures[3]!)!])
                } else if let captures = either1.firstMatch(in: remainder)?.captures {
                    rule = .either([Int(captures[0]!)!], [Int(captures[1]!)!])
                } else if let captures = sequence2.firstMatch(in: remainder)?.captures {
                    rule = .sequence([Int(captures[0]!)!, Int(captures[1]!)!, Int(captures[2]!)!])
                } else if let captures = sequence1.firstMatch(in: remainder)?.captures {
                    rule = .sequence([Int(captures[0]!)!, Int(captures[1]!)!])
                } else if let captures = one.firstMatch(in: remainder)?.captures {
                    rule = .sequence([Int(captures[0]!)!])
                } else if let captures = single.firstMatch(in: remainder)?.captures {
                    rule = .single(captures[0]!)
                } else {
                    fatalError()
                }
                
                rawRules[int] = rule
            }
            return rawRules
        }
        
        func buildRegexPattern(_ rule: Int, rawRules: [Int: Rule]) -> String {
            guard let rule = rawRules[rule] else { return "" }
            switch rule {
            case .single(let char):
                return char
            case .sequence(let rules):
                return rules.map { buildRegexPattern($0, rawRules: rawRules) }.joined()
            case .either(let a, let b):
                let newA = a.map { buildRegexPattern($0, rawRules: rawRules) }.joined()
                let newB = b.map { buildRegexPattern($0, rawRules: rawRules) }.joined()
                return "(\(newA)|\(newB))"
            }
        }
        
        func buildRegexPatternPart2(_ rule: Int, rawRules: [Int: Rule]) -> String {
   
            if rule == 8 {
                let rule42 = "(\(buildRegexPatternPart2(42, rawRules: rawRules)))"
                var rules: [String] = []
                
                // The regex expression can be 42 | 42 42 | 42 42 42 - so at some point it gets too big to ever match
                for i in 1...6 {
                    let array = Array(repeating: rule42, count: i).joined()
                    rules.append(array)
                }
                
                return "(\(rules.joined(separator: "|")))"
                
            }
            
            if rule == 11 {
                let rule42 =  "(\(buildRegexPatternPart2(42, rawRules: rawRules)))"
                let rule31 = "(\(buildRegexPatternPart2(31, rawRules: rawRules)))"

                var rules: [String] = []
                
                // The regex expression can be 42 31 | 42 42 31 31 | 42 42 42 31 31 31 - so at some point it gets too big to ever match
                for i in 1...7 {
                    let lhs = Array(repeating: rule42, count: i).joined()
                    let rhs = Array(repeating: rule31, count: i).joined()
                    rules.append(lhs + rhs)
                }
                
                return "(\(rules.joined(separator: "|")))"
            }
            
            guard let rule = rawRules[rule] else { return "" }
            switch rule {
            case .single(let char):
                return char
            case .sequence(let rules):
                return rules.map { buildRegexPatternPart2($0, rawRules: rawRules) }.joined()
            case .either(let a, let b):
                let newA = a.map { buildRegexPatternPart2($0, rawRules: rawRules) }.joined()
                let newB = b.map { buildRegexPatternPart2($0, rawRules: rawRules) }.joined()
                return "(\(newA)|\(newB))"
            }
        }
    }
    
}

extension TwentyTwenty.Day19 {
    public func solvePart1(input: [String]) throws -> Int {
        
        let raw = rawRules(input: input[0].components(separatedBy: "\n"))
        let regexExpression = "^" + self.buildRegexPattern(0, rawRules: raw) + "$"
        let regex = try Regex(string: regexExpression)
        
        let strings = input[1].components(separatedBy: "\n")
        
        var count = 0
        for string in strings {
            count = regex.matches(string) ? count + 1 : count
        }
        
        return count
    }
    
    public func solvePart2(input: [String]) throws -> Int {
        
        var raw = rawRules(input: input[0].components(separatedBy: "\n"))
        raw[8] = .either([42], [42, 8])
        raw[11] = .either([42, 31], [42, 11, 31])
        
        var maxLength = 0
        let strings = input[1].components(separatedBy: "\n")
        for string in strings {
            if string.count > maxLength { maxLength = string.count }
        }
        
        let regexExpression = "^" + self.buildRegexPatternPart2(0, rawRules: raw) + "$"
        let regex = try Regex(string: regexExpression)
        
        var count = 0
        for string in strings {
            count = regex.matches(string) ? count + 1 : count
        }
        
        return count
    }
}
