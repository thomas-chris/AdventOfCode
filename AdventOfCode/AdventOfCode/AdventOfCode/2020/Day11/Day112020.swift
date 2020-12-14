import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day11 {
        public init() {}

    
    enum Seat: String {
        case floor = "."
        case empty = "L"
        case full = "#"
    }
    
    let vectors: [(Position, Int) -> Position] = [
        { position, value in Position(x: position.x - value, y: position.y - value)},
        { position, value in Position(x: position.x - value, y: position.y)},
        { position, value in Position(x: position.x - value, y: position.y + value)},
        { position, value in Position(x: position.x , y: position.y - value)},
        { position, value in Position(x: position.x , y: position.y + value)},
        { position, value in Position(x: position.x + value, y: position.y - value)},
        { position, value in Position(x: position.x + value, y: position.y)},
        { position, value in Position(x: position.x + value, y: position.y + value)},
    ]
    }
}

extension TwentyTwenty.Day11 {
    public func solve1(input: [String]) -> Int {
        
        var ferry: [Position: Seat] = [:]
        
        input.enumerated().forEach { y, row in
            row.enumerated().forEach { x, seat in
                let position = Position(x: x, y: y)
                ferry[position] = Seat(rawValue: String(seat))!
            }
        }
        
        var changes = -1
        var newChanges = 0
        var loops = 0
        while newChanges != changes {
            var newFerry = ferry
            changes = newChanges
            for key in ferry.keys {
                let adjacentSeats = key.matrix.map { (position) in
                    ferry[position]
                }
                
                if ferry[key] == .empty && !adjacentSeats.contains(.full) {
                    newFerry[key] = .full
                    newChanges += 1
                }
                
                if ferry[key] == .full && adjacentSeats.filter({ $0 == .full }).count > 3 {
                    newFerry[key] = .empty
                    newChanges += 1
                }
            }
            ferry = newFerry
            loops += 1
        }

        return ferry.compactMapValues { (seat) -> Seat? in
            seat == .full ? .full : nil
        }.count
    }
    
    public func solve2(input: [String]) -> Int {
        
        var ferry: [Position: Seat] = [:]
        
        input.enumerated().forEach { x, row in
            row.enumerated().forEach { y, seat in
                let position = Position(x: x, y: y)
                ferry[position] = Seat(rawValue: String(seat))!
            }
        }
        
        
        let maxY = input.count
        let maxX = input[0].count
        
        return part2(ferry: ferry, maxX: maxX, maxY: maxY)
    }
    func part2(ferry: [Position: Seat], maxX: Int, maxY: Int) -> Int {
        
        var ferry = ferry
        
        //list of functions to traverse the directions of travel
        
        var changes = -1
        var newChanges = 0
        var count = 0
        while newChanges != changes {
            changes = newChanges
            var newFerry = ferry
            for key in ferry.keys {
                
                guard ferry[key] != .floor else { continue }
                
                let count = countMySeats(vectors: vectors, key: key, ferry: ferry)
                if ferry[key] == .empty && count == 0 {
                    newFerry[key] = .full
                    newChanges += 1
                } else if ferry[key] == .full && count > 4 {
                    newFerry[key] = .empty
                    newChanges += 1
                }
            }
            count += 1
            ferry = newFerry
//            printDic(input: ferry, maxX: maxX, maxY: maxY)
        }
 
        return ferry.compactMapValues { (seat) -> Seat? in
            seat == .full ? .full : nil
        }.count
    }
    
    func countMySeats(vectors: [(Position, Int) -> Position], key: Position, ferry: [Position: Seat]) -> Int {
        var count = 0
        for vector in vectors {
            var exit = false
            var step = 1
            while !exit {
                let newPostion = vector(key, step)
                step += 1

                if let value = ferry[newPostion] {
                    if value != .floor {
                        count += value == .full ? 1 : 0
                        exit = true
                    }
                    
                } else { exit = true }

            }
        }
        
        return count
    }
    
    
    
    
    func printDic(input: [Position: Seat], maxX: Int, maxY: Int) {
    
        for y in 0 ..< maxY {
            var line = ""
            for x in 0 ..< maxX {
                let char = input[Position(x: x, y: y)]!.rawValue
                line.append(char)
            }
            print(line)
        }
        print("")
        
    }
}
