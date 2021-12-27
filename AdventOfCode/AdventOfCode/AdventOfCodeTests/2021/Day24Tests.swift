import XCTest
import TwentyTwentyOne

class TestsDay24: XCTestCase {
    
    let input = Array(Input.array(seperator: "\n", file: "Day24", compactmap:  { string in string } ).dropLast())
    
    func test_day1_part1() {
        XCTAssertEqual(Day24.part1(input), 589411)
    }
    
    func test_day1_part2() {
        measure {
            XCTAssertEqual(Day24.part2(input), 2794240479217824)
        }
    }
}

