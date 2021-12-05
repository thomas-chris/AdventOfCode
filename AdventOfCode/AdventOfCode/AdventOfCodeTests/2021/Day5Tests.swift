import XCTest
import TwentyTwentyOne

class TestsDay5: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day5", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day5Example", compactmap:  { string in string } ).dropLast())
    
    func test_day5_part1_example() {
        XCTAssertEqual(Day5.part1(example), 5)
    }
    
    func test_day5_part1() {
        XCTAssertEqual(Day5.part1(input), 6548)
    }
    
    func test_day5_example() throws {
        XCTAssertEqual(try Day5.part2(example), 12)
    }
    
    func test_day5_part2() throws {
        measure {
            XCTAssertEqual(try? Day5.part2(input), 19663)
        }
    }
}

