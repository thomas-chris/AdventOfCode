import Algorithms
import Foundation
import Regex
import UIKit

public struct Day5 {

    public struct Vent {
        let start: Position
        let end: Position
    }
    
    public static func part1(_ input: [String]) -> Int {
        let regex: Regex = Regex(#"(\d+),(\d+) -> (\d+),(\d+)"#)
        let vents = input.map { line -> Vent in
            let match = regex.firstMatch(in: line)!.captures.compactMap { $0 }
            return Vent(start: Position(x: Int(match[0])!, y: Int(match[1])!),
                                end: Position(x: Int(match[2])!, y: Int(match[3])!))
                }
        
        /// only consider horizontal and vertical vents
        let filteredVents = vents.filter { $0.start.x == $0.end.x || $0.start.y == $0.end.y }
        
        var dic = [Position: Int]()
        let allVentPostions = filteredVents
            .map { vent in
                vent.start.vector(vent.end)
            }
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
    
    public static func part2(_ input: [String]) throws -> Int {
        let regex: Regex = Regex(#"(\d+),(\d+) -> (\d+),(\d+)"#)
        let vents = input.map { line -> Vent in
            let match = regex.firstMatch(in: line)!.captures.compactMap { $0 }
            return Vent(start: Position(x: Int(match[0])!, y: Int(match[1])!),
                                end: Position(x: Int(match[2])!, y: Int(match[3])!))
                }

        var dic = [Position: Int]()
        let allVentPostions = vents
            .map { vent in
                vent.start.vector(vent.end)
            }
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
