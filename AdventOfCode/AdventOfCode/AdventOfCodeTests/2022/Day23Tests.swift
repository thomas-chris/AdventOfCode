import XCTest
import TwentyTwentyTwo

class TestsDay23: XCTestCase {
    
    let day = Day23()
    
    func test_day1_part1() {
        let roomA = Day23.Room(id: .A, tiles: [.B, .D])
        let roomB = Day23.Room(id: .B, tiles: [.C, .D])
        let roomC = Day23.Room(id: .C, tiles: [.A, .B])
        let roomD = Day23.Room(id: .D, tiles: [.C, .A])
        let positions: [Day23.Tile] = [.free,.free,.free,.free,.free,.free,.free,.free,.free,.free,.free]
        let board = Day23.Board(rooms: [roomA, roomB, roomC, roomD], positions: positions, score: 0)
        
        XCTAssertEqual(day.solve(board), 16244)
    }
    
    func test_day1_part2() {
        let roomA = Day23.Room(id: .A, tiles: [.B, .D, .D, .D])
        let roomB = Day23.Room(id: .B, tiles: [.C, .B, .C, .D])
        let roomC = Day23.Room(id: .C, tiles: [.A, .A, .B, .B])
        let roomD = Day23.Room(id: .D, tiles: [.C, .C, .A, .A])
        let positions: [Day23.Tile] = [.free,.free,.free,.free,.free,.free,.free,.free,.free,.free,.free]
        let board = Day23.Board(rooms: [roomA, roomB, roomC, roomD], positions: positions, score: 0)
        
//        measure {
            XCTAssertEqual(day.solve(board), 43226 )
//        }
    }
    
}

