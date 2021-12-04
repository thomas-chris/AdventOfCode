import XCTest
import TwentyTwentyOne

class TestsDay4: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day4", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day4Example", compactmap:  { string in string } ).dropLast())
    
    func test_day3_part1_example() {
        XCTAssertEqual(Day4.part1(example), 4512)
    }
    
    func test_day3_part1() {
        XCTAssertEqual(Day4.part1(input), 21607)
    }
    
    func test_day3_example() throws {
        XCTAssertEqual(try Day4.part2(example), 1924)
    }
    
    func test_day3_part2() throws {
        measure {
            XCTAssertEqual(try? Day4.part2(input), 7863147)
        }
    }
}

