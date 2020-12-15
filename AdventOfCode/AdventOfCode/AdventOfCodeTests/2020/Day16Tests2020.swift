import XCTest
import AdventOfCode

class Advent2020TestsDay16: XCTestCase {
    
    func test_day16_example1() {
        let input = Input.getInputString(name: "Day162020_Example1").components(separatedBy: "\n")
        let day16 = TwentyTwenty.Day16()
        let value = day16.solvePart1(input: input)
        XCTAssertEqual(value, 165)

    }
    
    func test_day16_part1() {
        measure {
        let input = Input.getInputString(name: "Day162020").components(separatedBy: "\n")
        let day16 = TwentyTwenty.Day16()
        let value = day16.solvePart1(input: input)
        XCTAssertEqual(value, 15172047086292)
        }

    }
    
    func test_day16_part2() {
        measure {
            
        let input = Input.getInputString(name: "Day162020").components(separatedBy: "\n")
        let day16 = TwentyTwenty.Day16()
        let value = day16.solvePart2(input: input)
        XCTAssertEqual(value, 4197941339968)
        }
    }



}
