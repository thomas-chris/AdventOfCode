import Foundation
import Algorithms

extension TwentyTwenty {
    public class Day11 {
        public init() {}
    }
    
    enum Seat: String {
        case floor = "."
        case empty = "L"
        case full = "#"
    }
    
}

extension TwentyTwenty.Day11 {
    public func solve1(input: [String]) -> Int {
        
        var ferry: [Position: TwentyTwenty.Seat] = [:]
        
        input.enumerated().forEach { x, row in
            row.enumerated().forEach { y, seat in
                let position = Position(x: x, y: y)
                ferry[position] = TwentyTwenty.Seat(rawValue: String(seat))!
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
                
                if ferry[key] == .full && adjacentSeats.filter { $0 == .full }.count > 3 {
                    newFerry[key] = .empty
                    newChanges += 1
                }
            }
            ferry = newFerry
            loops += 1
        }
        
        return ferry.compactMapValues { (seat) -> TwentyTwenty.Seat? in
            seat == .full ? .full : nil
        }.count
    }
}

extension Position {
    var matrix: [Position] {
        
        [(Position(x: self.x - 1, y: self.y - 1)),
        (Position(x: self.x - 1, y: self.y)),
        (Position(x: self.x - 1, y: self.y + 1)),
        (Position(x: self.x, y: self.y - 1)),
        (Position(x: self.x, y: self.y + 1)),
        (Position(x: self.x + 1, y: self.y - 1)),
        (Position(x: self.x + 1, y: self.y)),
        (Position(x: self.x + 1, y: self.y + 1)),
        ]
        }
}
