import XCTest
import AdventOfCode

class Advent2020TestsDay22: XCTestCase {
    
    func test_day22_part1_example() {
            let input = Input.getInputString(name: "Day222020_Example1").components(separatedBy: "\n\n")
            let day22 = TwentyTwenty.Day22()
            let value = day22.solvePart1(input: input)
            XCTAssertEqual(value, 306)
    }
    
    func test_day22_part1() {
        measure {
            let input = Input.getInputString(name: "Day222020").components(separatedBy: "\n\n")
            let day22 = TwentyTwenty.Day22()
            let value = day22.solvePart1(input: input)
            XCTAssertEqual(value, 33559)
        }
    }
    
    func test_day22_part2_example() {
            let input = Input.getInputString(name: "Day222020_Example1").components(separatedBy: "\n\n")
            let day22 = TwentyTwenty.Day22()
            let value = day22.solvePart2(input: input)
            XCTAssertEqual(value, 291)
    }
    
    func test_day22_part2() {
        measure {
            let input = Input.getInputString(name: "Day222020").components(separatedBy: "\n\n")
            let day22 = TwentyTwenty.Day22()
            let value = day22.solvePart2(input: input)
            XCTAssertEqual(value, 0)
        }
    }
}
