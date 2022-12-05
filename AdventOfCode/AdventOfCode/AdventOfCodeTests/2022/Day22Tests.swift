import XCTest
import TwentyTwentyTwo

class TestsDay22: XCTestCase {
    
    let input = Array(Input.array(seperator: "\n", file: "Day22", compactmap:  { string in string } ).dropLast())
        
    let example1 = Array(Input.array(seperator: "\n", file: "Day22Example", compactmap:  { string in string } ).dropLast())
    
    func test_day1_part1_example1() {
        XCTAssertEqual(Day22.part1(example1), 39)
    }
    
    func test_day1_part1() {
        XCTAssertEqual(Day22.part1(input), 589411)
    }
    
    func test_day1_part2() {
        measure {
            XCTAssertEqual(Day22.part2(input), 1130514303649907)
        }
    }
}

