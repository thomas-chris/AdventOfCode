import Algorithms
import Foundation
import Regex
import UIKit

public struct Day5 {
    
    public static func part1(_ input: [String]) -> Int {
        solve(input, filter: true)
    }
    
    public static func part2(_ input: [String]) throws -> Int {
        solve(input, filter: false)
    }
    
    public struct Vent {
        let start: Position
        let end: Position
    }
    
    private static func getVents(_ input: [String], filterDiagonals: Bool) -> [Vent] {
        let regex: Regex = Regex(#"(\d+),(\d+) -> (\d+),(\d+)"#)
        let vents = input.map { line -> Vent in
            let match = regex.firstMatch(in: line)!.captures.compactMap { $0 }
            return Vent(start: Position(x: Int(match[0])!, y: Int(match[1])!),
                                end: Position(x: Int(match[2])!, y: Int(match[3])!))
                }
        
        if filterDiagonals {
            return vents.filter { $0.start.x == $0.end.x || $0.start.y == $0.end.y }
        }
        
        return vents
    }
    
    private static func solve(_ input: [String], filter: Bool) -> Int {
        var dic = [Position: Int]()
        getVents(input, filterDiagonals: filter)
            .map { $0.start.vector($0.end) }
            .flatMap { $0 }
            .forEach { position in
                if let count = dic[position] {
                    dic[position] = count + 1
                } else {
                    dic[position] = 1
                }
            }
    
        return dic.values.filter { $0 > 1 }.count
    }
}
