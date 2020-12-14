import XCTest
import AdventOfCode

class Advent2020TestsDay14: XCTestCase {
    
    func test_day14_example1() {
        let input = Input.getInputString(name: "Day142020_Example1").components(separatedBy: "\n")
        let day14 = TwentyTwenty.Day14()
        let value = day14.solvePart1(input: input)
        XCTAssertEqual(value, 165)

    }
    
    func test_day14_part1() {
        let input = Input.getInputString(name: "Day142020").components(separatedBy: "\n")
        let day14 = TwentyTwenty.Day14()
        let value = day14.solvePart1(input: input)
        XCTAssertEqual(value, 15172047086292)

    }
}
