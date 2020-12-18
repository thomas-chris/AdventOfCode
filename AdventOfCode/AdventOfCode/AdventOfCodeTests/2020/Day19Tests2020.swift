import XCTest
import AdventOfCode

class Advent2020TestsDay19: XCTestCase {
    
    func test_day19_example1() {
        let input = Input.getInputString(name: "Day192020_Example1").components(separatedBy: "\n")
        let day19 = TwentyTwenty.Day19()
        let value = day19.solvePart1(input: input)
        XCTAssertEqual(value, 71)

    }
    
    func test_day19_part1() {
        measure {
        let input = Input.getInputString(name: "Day192020").components(separatedBy: "\n")
        let day19 = TwentyTwenty.Day19()
        let value = day19.solvePart1(input: input)
        XCTAssertEqual(value, 7293529867931)
        }
    }
    
    func test_day19_2_example1() {
        let input = Input.getInputString(name: "Day192020_Example1").components(separatedBy: "\n")
        let day19 = TwentyTwenty.Day19()
        let value = day19.solvePart2(input: input)
        XCTAssertEqual(value, 231)

    }
    
    func test_day19_part2() {
        measure {
            
        let input = Input.getInputString(name: "Day192020").components(separatedBy: "\n")
        let day19 = TwentyTwenty.Day19()
        let value = day19.solvePart2(input: input)
        XCTAssertEqual(value, 60807587180737)
        }
    }



}
