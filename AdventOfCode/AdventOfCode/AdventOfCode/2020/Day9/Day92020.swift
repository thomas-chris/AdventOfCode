import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day9 {
        public init() {}
    }
}

extension TwentyTwenty.Day9 {
    public func solve1(input: [Double], consider: Int) -> Double {
        
        for index in consider..<input.count {
            let previous25 = input[(index - consider) ..< index]
            let possibleValues = previous25.combinations(ofCount: 2).map { $0.reduce(0, +) }
            if possibleValues.contains(input[index]) == false {
                return input[index]
            }
        }
        return -1
    }
    
    public func solve2(input: [Double], invalidNumber: Double) -> Double {
        
        for index in 0..<input.count {
            var sum: Double = 0
            var allValues: [Double] = []
            for value in input[index ..< input.count] {
                sum += value
                allValues.append(value)
                guard sum <= invalidNumber else { break }
                if sum == invalidNumber {
                    let sorted = allValues.sorted()
                    return sorted.first! + sorted.last!
                }
            }
        }
        return -1
    }
}
