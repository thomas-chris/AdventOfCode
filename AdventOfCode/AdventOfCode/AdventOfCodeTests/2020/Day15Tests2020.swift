import XCTest
import AdventOfCode

class Advent2020TestsDay15: XCTestCase {
    
    func test_day14_example1() {
        let input = Input.getInputString(name: "Day152020_Example1").components(separatedBy: "\n")
        let day15 = TwentyTwenty.Day15()
        let value = day15.solvePart1(input: input)
//        XCTAssertEqual(value, 165)

    }
    
    func test_day14_part1() {
        measure {
        let input = Input.getInputString(name: "Day152020").components(separatedBy: "\n")
        let day15 = TwentyTwenty.Day15()
        let value = day15.solvePart1(input: input)
//        XCTAssertEqual(value, 15172047086292)
        }

    }
}
