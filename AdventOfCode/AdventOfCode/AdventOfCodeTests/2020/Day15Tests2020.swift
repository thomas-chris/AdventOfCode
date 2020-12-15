import XCTest
import AdventOfCode

class Advent2020TestsDay15: XCTestCase {
    
    func test_day15_example0() {
        let input = [0,3,6]
        let day15 = TwentyTwenty.Day15()
        let value = day15.solvePart1(input: input)
        XCTAssertEqual(value, 436)
    }
    
    func test_day15_example1() {
        let input = [1,3,2]
        let day15 = TwentyTwenty.Day15()
        let value = day15.solvePart1(input: input)
        XCTAssertEqual(value, 1)

    }
    
    func test_day15_example2() {
        let input = [2,1,3]
        let day15 = TwentyTwenty.Day15()
        let value = day15.solvePart1(input: input)
        XCTAssertEqual(value, 10)

    }
    
    func test_day14_part1() {
        measure {
        let input = [16,1,0,18,12,14,19]
        let day15 = TwentyTwenty.Day15()
        let value = day15.solvePart1(input: input)
       XCTAssertEqual(value, 929)
        }

    }
    
    func test_day14_part2() {
        measure {
        let input = [16,1,0,18,12,14,19]
        let day15 = TwentyTwenty.Day15()
        let value = day15.solvePart2(input: input)
       XCTAssertEqual(value, 16671510)
        }

    }
}
