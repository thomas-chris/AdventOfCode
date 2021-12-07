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

        var dicOfPostion = [Int: Int]()
        for position in input {
            dicOfPostion[position, default: 0] += 1
        }

        var allDistances =  [Int]()
        for position in 0...input.max()! {
            let distance = dicOfPostion.keys.map { key -> Int in
                let distance = abs(key - Int(position))
                return (distance * (distance + 1) / 2) * dicOfPostion[key]!
            }.reduce(0,+)
            allDistances.append(distance)
        }
        
        return allDistances.min()!
    }
}
