import Foundation

extension TwentyTwenty {
    public class Day5 {
        public init() {}
    }
}

extension TwentyTwenty.Day5 {
    public func boardingPassFilter(input: [String]) -> ([(row: Int, column: Int, seat: Int)], Int, [Int]) {
        
        let seats = input.map { pass -> (row: Int, column: Int, seat: Int) in
            var rows = 0...127
            for value in pass.trimmingCharacters(in: .whitespacesAndNewlines).prefix(7) {
                if value == "B" {
                    rows = (rows.first! + rows.count / 2)...rows.last!
                } else {
                    rows = rows.first!...(rows.first! + rows.count / 2)
                }
            }
            let row = rows.first!
            
            var columns = 0...7
            for value in pass.trimmingCharacters(in: .whitespacesAndNewlines).suffix(3) {
                if value == "R" {
                    columns = (columns.first! + columns.count / 2)...columns.last!
                } else {
                    columns = columns.first!...(columns.first! + columns.count / 2)
                }
            }
            let column = columns.first!
            
            return (row: row, column: column, seat: (8 * row) + column)
        }
        
        let seatIds = seats.map { (row, column, seat) -> Int in seat }
        
        return (seats, seats.map { (row, column, seat) -> Int in seat }.max()!, seatIds)
    }
    
    public func boardingPassFilterV2(input: [String]) -> [Int] {
        
        return input.map { seat -> String in
            seat.replacingOccurrences(of: "F", with: "0")
                .replacingOccurrences(of: "B", with: "1")
                .replacingOccurrences(of: "L", with: "0")
                .replacingOccurrences(of: "R", with: "1")
        }
        .compactMap { seat -> Int? in
            guard let row = Int(seat.prefix(7), radix: 2),
                  let column = Int(seat.suffix(3), radix: 2) else {
                return nil
            }
            
            return 8 * row + column
        }
    }
    
    public func findYourPass(input: [Int]) -> Int {
        let sorted = input.sorted { $0 < $1 }
        var i = 0
        var seat = sorted[0]
        while true {
            seat += 1
            if sorted[i+1] != seat {
                break
            }
            i += 1
        }
        return (sorted[i] + 1)
    }
}
