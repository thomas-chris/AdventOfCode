import XCTest
import TwentyTwentyTwo

class TestsDay5: XCTestCase {

    let input = Array(Input.array(seperator: "\n\n", file: "Day5", compactmap:  { string in string } ))
        
    let example = Array(Input.array(seperator: "\n\n", file: "Day5Example", compactmap:  { string in string } ))
    
    func test_day5_part1_example() {
        XCTAssertEqual(Day5.part1(example), "CMZ")
    }
    
    func test_day5_part1() {
        XCTAssertEqual(Day5.part1(input), "CVCWCRTVQ")
    }
    
    func test_day5_example() throws {
        XCTAssertEqual(try Day5.part2(example), "MCD")
    }
    
    func test_day5_part2() throws {
        measure {
            XCTAssertEqual(try? Day5.part2(input), "CNSCZWLVT")
        }
    }
}

