import XCTest
import AdventOfCode

class Advent2020TestsDay17: XCTestCase {
    
    func test_day17_example1() {
        let input = Input.getInputString(name: "Day172020_Example1").components(separatedBy: "\n")
        let day17 = TwentyTwenty.Day17()
        let value = day17.solvePart1(input: input)
        XCTAssertEqual(value, 112)

    }
    
    func test_day14_part1() {
//        measure {
        let input = Input.getInputString(name: "Day172020").components(separatedBy: "\n")
        let day17 = TwentyTwenty.Day17()
        let value = day17.solvePart1(input: input)
        XCTAssertEqual(value, 263)
//        }

    }
    
    func test_day17_part2() {
        measure {
            
        let input = Input.getInputString(name: "Day172020").components(separatedBy: "\n")
        let day17 = TwentyTwenty.Day17()
        let value = day17.solvePart2(input: input)
        XCTAssertEqual(value, 1680)
        }
    }



}
