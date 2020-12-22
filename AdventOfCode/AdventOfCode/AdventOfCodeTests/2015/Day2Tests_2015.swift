import XCTest
import AdventOfCode

class Advent2015TestsDay2: XCTestCase {

    func test_day2() {
        let input = Input.getInputString(name: "Day2_2015").components(separatedBy: "\n")
        
        let day2 = TwentyFifteen.Day2()
        let results = day2.solvePart1(input: input)
        XCTAssertEqual(results, 1588178)
    }
    
    func test_day1_part2() {
        let input = Input.getInputString(name: "Day2_2015").components(separatedBy: "\n")
        
        let day2 = TwentyFifteen.Day2()
        let results = day2.solvePart2(input: input)
        XCTAssertEqual(results, 3783758)
    }
}
