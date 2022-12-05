import XCTest
import TwentyTwentyTwo

class TestsDay20: XCTestCase {
    
    let input = Array(Input.array(seperator: "\n", file: "Day20", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day20Example", compactmap:  { string in string } ).dropLast())
    
    func test_day20_part1_example() {
        XCTAssertEqual(Day20.part1(example, times: 2), 35)
    }
    
    func test_day20_part1() {
        XCTAssertEqual(Day20.part1(input, times: 2), 5218)
    }
    
    func test_day20_example() throws {
        XCTAssertEqual(Day20.part1(example, times: 50), 3351)
    }
    
    func test_day20_part2() {
        XCTAssertEqual(Day20.part1(input, times: 50), 15527)
    }
   
}

