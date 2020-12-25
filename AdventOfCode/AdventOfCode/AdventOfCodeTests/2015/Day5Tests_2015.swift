import XCTest
import AdventOfCode

class Advent2015TestsDay5: XCTestCase {

    func test_day5() {
        let input = Input.getInputString(name: "Day5_2015").components(separatedBy: "\n")
        
        let day5 = TwentyFifteen.Day5()
        let results = day5.solvePart1(input: input)
        XCTAssertEqual(results, 1588178)
    }
    
    func test_day5_part2() {
        let input = Input.getInputString(name: "Day2_2015").components(separatedBy: "\n")
        
        let day5 = TwentyFifteen.Day5()
        let results = day5.solvePart2(input: input)
        XCTAssertEqual(results, 3783758)
    }
}
