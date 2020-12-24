import XCTest
import AdventOfCode

class Advent2015TestsDay4: XCTestCase {

    func test_day4() {
        let input = "yzbqklnj"
        
        let day4 = TwentyFifteen.Day4()
        let results = day4.solvePart1(input: input)
        XCTAssertEqual(results, 282749)
    }
    
    func test_day4_part2() {
        let input = "yzbqklnj"
        
        let day4 = TwentyFifteen.Day4()
        let results = day4.solvePart2(input: input)
        XCTAssertEqual(results, 9962624)
    }
}
