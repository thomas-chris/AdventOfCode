import XCTest
import AdventOfCode

class Advent2020TestsDay11: XCTestCase {
    
    func test_day11_example1() {
        let input = Input.getInputString(name: "Day112020_Example1").components(separatedBy: "\n")
        let day11 = TwentyTwenty.Day11()
        let count = day11.solve1(input: input)
        XCTAssertEqual(count, 37)
    }
    
    func test_day11() {
        let input = Input.getInputString(name: "Day112020").components(separatedBy: "\n")
        let day11 = TwentyTwenty.Day11()
        let count = day11.solve1(input: input)
        XCTAssertEqual(count, 2265)
    }
    
    func test_day11_example2() {
        let input = Input.getInputString(name: "Day112020_Example1").components(separatedBy: "\n")
        let day11 = TwentyTwenty.Day11()
        let count = day11.solve2(input: input)
        XCTAssertEqual(count, 26)
    }
    
    func test_day11_part2() {
        let input = Input.getInputString(name: "Day112020").components(separatedBy: "\n")
        let day11 = TwentyTwenty.Day11()
        let count = day11.solve2(input: input)
        XCTAssertEqual(count, 2045)
    }
}
