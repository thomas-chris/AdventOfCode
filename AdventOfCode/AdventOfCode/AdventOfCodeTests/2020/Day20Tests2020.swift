import XCTest
import AdventOfCode

class Advent2020TestsDay20: XCTestCase {
    
    func test_day20_part1() {
//        measure {
            let input = Input.getInputString(name: "Day202020").components(separatedBy: "\n\n")
            let day20 = TwentyTwenty.Day20()
            let value = day20.solvePart1(input: input)
            XCTAssertEqual(value, 28057939502729)
//        }
    }
    
    func test_day20_part2() {

        let input = Input.getInputString(name: "Day202020").components(separatedBy: "\n\n")
        let day20 = TwentyTwenty.Day20()
        let value = day20.solvePart2(input: input)
        XCTAssertEqual(value, 400)
    }
}
