import XCTest
import AdventOfCode

class Advent2020TestsDay25: XCTestCase {
    
    func test_day25_part1_example() {
            let input = Input.getInputString(name: "Day252020_Example1").components(separatedBy: "\n\n")
            let day25 = TwentyTwenty.Day25()
            let value = day25.solvePart1(input: input)
            XCTAssertEqual(value, 306)
    }
    
    func test_day25_part1() {
        measure {
            let input = Input.getInputString(name: "Day252020").components(separatedBy: "\n\n")
            let day25 = TwentyTwenty.Day25()
            let value = day25.solvePart1(input: input)
            XCTAssertEqual(value, 33559)
        }
    }
    
    func test_day25_part2_example() {
            let input = Input.getInputString(name: "Day252020_Example1").components(separatedBy: "\n\n")
            let day25 = TwentyTwenty.Day25()
            let value = day25.solvePart2(input: input)
            XCTAssertEqual(value, 291)
    }
    
    func test_day25_part2() {
        measure {
            let input = Input.getInputString(name: "Day252020").components(separatedBy: "\n\n")
            let day25 = TwentyTwenty.Day25()
            let value = day25.solvePart2(input: input)
            XCTAssertEqual(value, 32789)
        }
    }
}
