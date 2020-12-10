import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day10 {
        public init() {}
    }
}

extension TwentyTwenty.Day10 {
    public func solve1(input: [Double]) -> Int {
        
        var sorted = input.sorted()
        var ones = 0
        var threes = 1 // covers the last one to my thing
        
        sorted.insert(0, at: 0)
        
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
    
    public func solve2(input: [Double]) -> Int {
        var sorted = input.sorted().map { Int($0) }
        sorted.insert(0, at: 0)
        var jolts: [Int: Int] = [:]
        for value in sorted {
            
            // get all the possible paths to get to that value
            // such that it will be an array of length 1, 2 or 3
            
            let possiblePaths = sorted.filter { jolt -> Bool in
                ( jolt >= value - 3 ) && (jolt < value)
            }
            
            // now try and get how many ways there are to get to each number in that list of possible paths
            // if you don't have a number, this is the first time you've got to it, so there must be at least one value
            
            let counts = possiblePaths.map { jolt in
                jolts[jolt] ?? 1
            }
            
            // now sum up the number of ways to get to the number you are evaluating. Each is how many ways to get there on top of the preceding number of ways
            
            if value > 0 {
                jolts[value] = counts.reduce(0, +)
            }
        }   
    
        return jolts[sorted.last!]!
    }
}

