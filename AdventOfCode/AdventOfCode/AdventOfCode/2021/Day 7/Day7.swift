import Algorithms
import Foundation
import Regex
import UIKit

public struct Day7 {
    
    public static func part1(_ input: [Int]) -> Int {
        
        let median = input.median()
        var dicOfPostion = [Int: Int]()
        for position in input {
            dicOfPostion[position, default: 0] += 1
        }
        
        return dicOfPostion.keys.map { key in
            abs(key - Int(median)) * (dicOfPostion[key] ?? 0)
        }.reduce(0, +)
    }
    
    public static func part2(_ input: [Int]) throws -> Int {
        let ceilingAve = ceil(Double(input.reduce(0, +)) / Double(input.count))
        let floorAve = floor(Double(input.reduce(0, +)) / Double(input.count))
        
        var dicOfPostion = [Int: Int]()
        for position in input {
            dicOfPostion[position, default: 0] += 1
        }
        
        let results = dicOfPostion.keys.map { key -> (Int,Int) in
            let cDistance = abs(key - Int(ceilingAve))
            let fDistance = abs(key - Int(floorAve))
            return ((cDistance * (cDistance + 1) / 2) * (dicOfPostion[key] ?? 0), (fDistance * (fDistance + 1) / 2) * (dicOfPostion[key] ?? 0))
        }.reduce((0,0)) { partialResult, values in
            let newC = partialResult.0 + values.0
            let newF = partialResult.1 + values.1
            return (newC, newF)
        }
        
        return results.0 < results.1 ? results.0 : results.1
    }
}
