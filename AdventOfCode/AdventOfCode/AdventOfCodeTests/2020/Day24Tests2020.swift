import XCTest
import AdventOfCode

class Advent2020TestsDay24: XCTestCase {
    
    func test_day24_part1_example() {
            let input = Input.getInputString(name: "Day242020_Example1").components(separatedBy: "\n\n")
            let day24 = TwentyTwenty.Day24()
            let value = day24.solvePart1(input: input)
            XCTAssertEqual(value, 306)
    }
    
    func test_day24_part1() {
        measure {
            let input = Input.getInputString(name: "Day242020").components(separatedBy: "\n\n")
            let day24 = TwentyTwenty.Day24()
            let value = day24.solvePart1(input: input)
            XCTAssertEqual(value, 33559)
        }
    }
    
    func test_day24_part2_example() {
            let input = Input.getInputString(name: "Day242020_Example1").components(separatedBy: "\n\n")
            let day24 = TwentyTwenty.Day24()
            let value = day24.solvePart2(input: input)
            XCTAssertEqual(value, 291)
    }
    
    func test_day24_part2() {
        measure {
            let input = Input.getInputString(name: "Day242020").components(separatedBy: "\n\n")
            let day24 = TwentyTwenty.Day24()
            let value = day24.solvePart2(input: input)
            XCTAssertEqual(value, 32789)
        }
    }
}
