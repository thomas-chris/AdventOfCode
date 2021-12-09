import XCTest
import TwentyTwentyOne

class TestsDay9: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day9", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day9Example", compactmap:  { string in string } ).dropLast())
    
    func test_day9_part1_example() {
        XCTAssertEqual(Day9.part1(example), 15)
    }
    
    func test_day9_part1() {
        XCTAssertEqual(Day9.part1(input), 504)
    }
    
    func test_day9_example() throws {
        XCTAssertEqual(try Day9.part2(example), 1134)
    }
    
    func test_day9_part2() throws {
        measure {
            XCTAssertEqual(try? Day9.part2(input), 1558722)
        }
    }
}

