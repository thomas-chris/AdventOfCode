import XCTest
import AdventOfCode

class Advent2020TestsDay23: XCTestCase {
    
    func test_day23_part1_example() {
            let input = Input.getInputString(name: "Day232020_Example1").components(separatedBy: "\n\n")
            let day23 = TwentyTwenty.Day23()
            let value = day23.solvePart1(input: input)
            XCTAssertEqual(value, 306)
    }
    
    func test_day23_part1() {
        measure {
            let input = Input.getInputString(name: "Day232020").components(separatedBy: "\n\n")
            let day23 = TwentyTwenty.Day23()
            let value = day23.solvePart1(input: input)
            XCTAssertEqual(value, 33559)
        }
    }
    
    func test_day23_part2_example() {
            let input = Input.getInputString(name: "Day232020_Example1").components(separatedBy: "\n\n")
            let day23 = TwentyTwenty.Day23()
            let value = day23.solvePart2(input: input)
            XCTAssertEqual(value, 291)
    }
    
    func test_day23_part2() {
        measure {
            let input = Input.getInputString(name: "Day232020").components(separatedBy: "\n\n")
            let day23 = TwentyTwenty.Day23()
            let value = day23.solvePart2(input: input)
            XCTAssertEqual(value, 32789)
        }
    }
}
