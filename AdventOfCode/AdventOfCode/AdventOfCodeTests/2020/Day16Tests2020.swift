import XCTest
import AdventOfCode

class Advent2020TestsDay16: XCTestCase {
    
    func test_day16_example1() {
        let input = Input.getInputString(name: "Day162020_Example1")
        let day16 = TwentyTwenty.Day16()
        let value = day16.solvePart1(input: input)
        XCTAssertEqual(value, 71)

    }
    
    func test_day16_part1() {
//        measure {
        let input = Input.getInputString(name: "Day162020")
        let day16 = TwentyTwenty.Day16()
        let value = day16.solvePart1(input: input)
        XCTAssertEqual(value, 19240)
//        }

    }
    
    func test_day16_part2_example() {

        let input = Input.getInputString(name: "Day162020_Example1")
        let day16 = TwentyTwenty.Day16()
        let value = day16.solvePart2(input: input)
        XCTAssertEqual(value, 1716)
    }
    
    func test_day16_part2() {

        let input = Input.getInputString(name: "Day162020")
        let day16 = TwentyTwenty.Day16()
        let value = day16.solvePart2(input: input)
        XCTAssertEqual(value, 5527728694937)
    }



}
