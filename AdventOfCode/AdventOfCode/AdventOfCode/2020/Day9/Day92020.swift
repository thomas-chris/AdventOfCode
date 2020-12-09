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
}
