import XCTest
import AdventOfCode

class Advent2020TestsDay23: XCTestCase {
    
    func test_day23_part1_example() {
            let input = "389125467"
            let day23 = TwentyTwenty.Day23()
            let value = day23.solvePart1(input: input, moves: 100)
            XCTAssertEqual(value, "67384529")
    }
    
    func test_day23_part1() {
        measure {
            let input = "784235916"
            let day23 = TwentyTwenty.Day23()
            let value = day23.solvePart1(input: input, moves: 100)
            XCTAssertEqual(value, "53248976")
        }
    }
    
    func test_day23_part2() {
        measure {
            let input = "784235916"
            let day23 = TwentyTwenty.Day23()
            let value = day23.solvePart2(input: input)
            XCTAssertEqual(value, 418819514477)
        }
    }
    
    func test_day23_part2_PJ() {
        measure {
            let input = "157623984"
            let day23 = TwentyTwenty.Day23()
            let value = day23.solvePart2(input: input)
            XCTAssertEqual(value, 111057672960)
        }
    }
}
