import Algorithms
import Foundation
import Regex
import UIKit

public struct Day5 {
    
    public typealias Stack = [Character]
    public typealias Stacks = [Int: Stack]
    static let regex = Regex("[\\w]* ([\\d]+) [\\w]* ([\\d]+) [\\w]* ([\\d]+)")
    
    public static func part1(_ input: [String]) -> String {
        
        var (map, instructions) = parse(input)
        for instruction in instructions {
            for i in 1...instruction[0] {
                var from = map[instruction[1]]
                var to = map[instruction[2]]
                let last = from?.removeLast() ?? " "
                to?.append(last)
                
                map[instruction[2]] = to
                map[instruction[1]] = from
            }
        }
        
        var solution = ""
        for key in 1...map.keys.count {
            solution.append(map[key]?.last ?? Character(""))
        }
        return solution
    }
    
    public static func part2(_ input: [String]) throws -> String {
        var (map, instructions) = parse(input)
        
        for instruction in instructions {
            guard var from = map[instruction[1]],
                  var to = map[instruction[2]]
            else { fatalError("failure to parse data") }
            
            let move = from.dropFirst(((from.count ?? 0) - instruction[0]))
            to.append(contentsOf: move)
            
            map[instruction[2]] = to
            map[instruction[1]] = from.dropLast(instruction[0])
            
        }
        
        var solution = ""
        for key in 1...map.keys.count {
            solution.append(map[key]?.last ?? Character(" "))
        }
        return solution
    }
    
    private static func parse(_ input: [String]) -> ([Optional<Int> : Day5.Stack], [[Int]]) {
        guard let mapValues = input
                .first?
                .components(separatedBy: "\n")
                .map(Array.init),
            let instructions = input
                .last?
                .components(separatedBy: "\n")
                .dropLast()
                .compactMap({ string in
                    regex.firstMatch(in: string)?.captures.compactMap({ string in
                        Int(string ?? "")
                    })
                })
        else { fatalError("Failed to parse data") }
        
        var maxIndex = 0
        mapValues.forEach { if $0.count - 1 > maxIndex { maxIndex = $0.count - 1}}
        var map = mapValues
            .map { array in
                var mutated = array
                mutated.resize(maxIndex, fillWith: Character(" "))
                return mutated
            }
            .transposed()
            .filter { array in
                guard let value = array.last,
                      let _ = Int(String(value))
                else
                { return false}
                return true
            }
            .map { Array($0.reversed()).filter({ $0 != " " }) }
            .reduce(into: Stacks()) { (result,stack)  in
                result[Int(String(stack.first!))] = Stack(stack.dropFirst())
            }
        
        return (map, instructions)
    }
}

extension RangeReplaceableCollection {
    public mutating func resize(_ size: IndexDistance, fillWith value: Iterator.Element) {
        let c = count
        if c < size {
            append(contentsOf: repeatElement(value, count: c.distance(to: size)))
        } else if c > size {
            let newEnd = index(startIndex, offsetBy: size)
            removeSubrange(newEnd ..< endIndex)
        }
    }
}
