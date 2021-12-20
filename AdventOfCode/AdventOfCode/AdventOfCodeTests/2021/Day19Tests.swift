import XCTest
import TwentyTwentyOne

class TestsDay19: XCTestCase {
    
    let input = Array(Input.array(seperator: "\n", file: "Day19", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day19Example", compactmap:  { string in string } ).dropLast())
    
    func test_day19_part1_example() {
        XCTAssertEqual(Day19.part1(example).0, 79)
    }
    
    func test_day19_part1() {
        XCTAssertEqual(Day19.part1(input).0, 445)
    }
    
    func test_day19_example() throws {
        XCTAssertEqual(Day19.part1(example).1, 3621)
    }
    
    func test_day19_part2() {
        XCTAssertEqual(Day19.part1(input).1, 13225)
    }
   
}

