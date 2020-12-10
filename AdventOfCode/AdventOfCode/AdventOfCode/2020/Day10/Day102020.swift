import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day10 {
        public init() {}
    }
}

extension TwentyTwenty.Day10 {
    public func solve1(input: [Double]) -> Int {
        
        let sorted = input.sorted()
        var ones = 0
        var threes = 1 // covers the last one to my thing
        
        
        if sorted[0] - 0 == 1 {
            ones += 1
        }
        
        if sorted[0] - 0 == 3 {
            threes += 1
        }
        
        for i in 0 ..< (sorted.count - 1) {
            if (sorted[i+1] - sorted[i] == 1) {
                ones += 1
            }
            if (sorted[i+1] - sorted[i] == 3) {
                threes += 1
            }
        }

        return ones * threes
        
    }
    
    public func solve2(input: [Double]) -> Double {
        
       return 0
    }
}
