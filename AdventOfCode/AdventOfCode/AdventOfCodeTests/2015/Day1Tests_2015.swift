import XCTest
import AdventOfCode

class Advent2015TestsDay1: XCTestCase {

    func test_day1() {
        let input = Input.getInputString(name: "Day1_2015")
        
        let day1 = TwentyFifteen.Day1()
        let results = day1.solvePart1(input: input)
        XCTAssertEqual(results, 232)
    }
    
    func test_day1_part2() {
        let input = Input.getInputString(name: "Day1_2015")
        
        let day1 = TwentyFifteen.Day1()
        let results = day1.solvePart2(input: input)
        XCTAssertEqual(results, 1783)
    }
}
