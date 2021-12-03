import Algorithms
import Foundation

public struct Day3 {
    
    public static func part1(_ input: [[String.Element]]) -> Int {
        
        var gammaRate = ""
        var epsilonRate = ""
        for column in 0..<input.first!.count {
            var listOfColumnValues: [String.Element] = []
            var ones = 0
            var zeros = 0
            for row in input {
                if row[column] == "1" {
                    ones += 1
                } else {
                    zeros += 1
                }
            }
            
            if ones >= zeros {
                gammaRate.append("1")
                epsilonRate.append("0")
            } else {
                gammaRate.append("0")
                epsilonRate.append("1")
            }
        }
        let gammaNumber = Int(gammaRate, radix: 2) ?? 0
        let epsilonNumber = Int(epsilonRate, radix: 2) ?? 0
        
        return gammaNumber * epsilonNumber
    }
    
    public static func part2(_ input: [[String.Element]]) -> Int {
        
        return 1
    }
}
