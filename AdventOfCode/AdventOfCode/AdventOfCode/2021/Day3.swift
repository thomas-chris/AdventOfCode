import Algorithms
import Foundation

public struct Day3 {
    
    public static func part1(_ input: [[String.Element]]) -> Int {
        
        var gammaRate = ""
        var epsilonRate = ""
        for column in 0..<input.first!.count {
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
        let gammaNumber = Int(gammaRate, radix: 2)!
        let epsilonNumber = Int(epsilonRate, radix: 2)!
        
        return gammaNumber * epsilonNumber
    }
    
    public static func part1_transpose(_ input: [[String.Element]]) -> Int {
        let transpose = input.transposed()
        print(transpose)
        return 1
    }
    
    public static func part2(_ input: [[String.Element]]) -> Int {
        let o2 = calcOxygen(input)
        let co2 = calcCo2(input)

        return o2 * co2
    }
    
    private static func calcOxygen(_ input: [[String.Element]]) -> Int {
        var changingOxygenInput = input
        
        for column in 0..<changingOxygenInput.first!.count {
            var ones = 0
            var zeros = 0
            for row in changingOxygenInput {
                if row[column] == "1" {
                    ones += 1
                } else {
                    zeros += 1
                }
            }
            
            changingOxygenInput = changingOxygenInput.filter({ value in String(value[column]) == (ones >= zeros ? "1" : "0") })
            if changingOxygenInput.count == 1 {
                let string = changingOxygenInput[0].map { String($0) }.joined()
                return Int(string, radix: 2)!
            }
        }
        
        return Int.min
    }
    
    private static func calcCo2(_ input: [[String.Element]]) -> Int {
        var changingOxygenInput = input
    
        for column in 0..<changingOxygenInput.first!.count {
            var ones = 0
            var zeros = 0
            for row in changingOxygenInput {
                if row[column] == "1" {
                    ones += 1
                } else {
                    zeros += 1
                }
            }
            
            changingOxygenInput = changingOxygenInput.filter({ value in String(value[column]) == (ones < zeros ? "1" : "0") })
            if changingOxygenInput.count == 1 {
                let string = changingOxygenInput[0].map { String($0) }.joined()
                return Int(string, radix: 2)!
            }
        }
        
        return Int.min
    }
}

