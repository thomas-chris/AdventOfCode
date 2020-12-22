import XCTest
import AdventOfCode

class Advent2015TestsDay3: XCTestCase {

    func test_day3() {
        let input = Input.getInputString(name: "Day3_2015")
        
        let day3 = TwentyFifteen.Day3()
        let results = day3.solvePart1(input: input)
        XCTAssertEqual(results, 2572)
    }
    
    func test_day3_part2() {
        let input = Input.getInputString(name: "Day3_2015")
        
        let day3 = TwentyFifteen.Day3()
        let results = day3.solvePart2(input: input)
        XCTAssertEqual(results, 2631)
    }
}
