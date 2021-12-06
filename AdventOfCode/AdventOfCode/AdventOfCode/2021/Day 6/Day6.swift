import Algorithms
import Foundation
import Regex
import UIKit

public struct Day6 {
    
    public static func part1(_ input: [Int], turns: Int) throws -> Int {
        
        var dictionaryOfFish = [Int: Int]()
        
        for fish in input {
            dictionaryOfFish[fish, default: 0] += 1
        }
        
        var newFishDictionary = [Int: Int]()
        for _ in 1...turns {
            
            let oldFish = dictionaryOfFish[0] ?? 0
            newFishDictionary[8] = oldFish
            newFishDictionary[0] = dictionaryOfFish[1]
            newFishDictionary[1] = dictionaryOfFish[2]
            newFishDictionary[2] = dictionaryOfFish[3]
            newFishDictionary[3] = dictionaryOfFish[4]
            newFishDictionary[4] = dictionaryOfFish[5]
            newFishDictionary[5] = dictionaryOfFish[6]
            newFishDictionary[6] = (dictionaryOfFish[7] ?? 0) + oldFish
            newFishDictionary[7] = dictionaryOfFish[8]
            dictionaryOfFish = newFishDictionary
        }
        
        return dictionaryOfFish.values.reduce(0, +)
    }
    
    public static func part2(_ input: [Int]) throws -> Int {
        return 1
    }
}
