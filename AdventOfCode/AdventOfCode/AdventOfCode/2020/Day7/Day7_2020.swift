import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day7 {
        public init() {}
    }
    
    public struct BagRule {
        let bag: String
        let amount: Int
    }
}

extension TwentyTwenty.Day7  {
    
    public func solve(input: [String]) -> (Int, Int) {
        let bags = getBags(input: input)
        return (countOfBagsThatCanHoldShinyWhite(bagsAndRules: bags), getTotalBagNumbers(bagsAndRules: bags))
    }
    
    func getBags(input: [String]) -> [String: [TwentyTwenty.BagRule]] {
        var bagsAndRules: [String: [TwentyTwenty.BagRule]] = [:]
        
        input.forEach { line in
            let charactersToTrim = CharacterSet(["."])
            let words = line.trimmingCharacters(in: charactersToTrim).components(separatedBy: " ")
            
            let bag = words.prefix(2).joined()
            var rules: [TwentyTwenty.BagRule] = []
            for index in stride(from: 0, through: words.count, by: 4) {
                if (index + 4) < words.count {
                    if let amount = Int(words[index + 4]) {
                        let bag = words[index + 5] + words[index + 6]
                        rules.append(TwentyTwenty.BagRule(bag: bag, amount: amount))
                    }
                }
            }
            
            bagsAndRules[bag] = rules
        }
        
        return bagsAndRules
    }
    
    func countOfBagsThatCanHoldShinyWhite(bagsAndRules: [String: [TwentyTwenty.BagRule]]) -> Int {
        let shinygold = "shinygold"
        
        var bagsOutside: [String: [String]] = [:]
        
        //invert the list
        for (outside, rules) in bagsAndRules {
            for rule in rules {
                if let list = bagsOutside[rule.bag] {
                    bagsOutside[rule.bag] = list + [outside]
                } else {
                    bagsOutside[rule.bag] = [outside]
                }
            }
        }
        
        var stack = [shinygold]
        var seen: Set<String> = []

        while let color = stack.popLast() {
            // get the bags inside of the bag to process
            for other in bagsOutside[color] ?? [] {
                
                // if you haven't processed this bag already then add it to the list to process - this way you only process each bag once
                if seen.insert(other).inserted {
                    stack.append(other)
                }
            }
        }
        
        return seen.count
    }
    
    func getTotalBagNumbers(bagsAndRules: [String: [TwentyTwenty.BagRule]]) -> Int {
    
        let startingBag = TwentyTwenty.BagRule(bag: "shinygold", amount: 1)
        var stack = [startingBag]
        var totalBags = 0
        
        while let bag = stack.popLast() {
            for rules in bagsAndRules[bag.bag] ?? [] {
                let newAmount = bag.amount * rules.amount
                stack.append(TwentyTwenty.BagRule(bag: rules.bag, amount: newAmount))
                totalBags += newAmount
            }
        }
        
        return totalBags
    }
}
