import Algorithms
import Foundation
import UIKit

public struct Day4 {
    
    public static func part1(_ input: [String]) -> Int {
        input
            .compactMap({ string -> Int? in
                let elves = string.components(separatedBy: ["-",","]).compactMap(Int.init)
                if (elves[0] >= elves[2] && elves[1] <= elves[3]) || (elves[2] >= elves[0] && elves[3] <= elves[1]) {
                    return 1
                }
                return nil
            })
            .reduce(0,+)
        
    }
    
    public static func part2(_ input: [String]) throws -> Int {
        let onesThatDontOverlap = input
            .compactMap({ string -> Int? in
                let elves = string.components(separatedBy: ["-",","]).compactMap(Int.init)
                if elves[1] < elves[2] || elves[0] > elves[3] {
                    return 1
                }
                return nil
            })
            .reduce(0,+)
        
        return input.count - onesThatDontOverlap
    }
}
