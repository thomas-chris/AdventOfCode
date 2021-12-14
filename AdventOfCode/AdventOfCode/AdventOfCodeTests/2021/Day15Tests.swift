import XCTest
import TwentyTwentyOne

class TestsDay15: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day15", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day15Example", compactmap:  { string in string } ).dropLast())

    func test_day15_part1_example() {
        XCTAssertEqual(Day15.part1(example), 1588)
    }

    func test_day15_part1() {
        XCTAssertEqual(Day15.part1(input), 2233)
    }
    
    func test_day15_example() throws {
        XCTAssertEqual(Day15.part2(example), 2188189693529)
    }
    
    func test_day15_part2() throws {
//        measure {
        XCTAssertEqual(Day15.part2(input), 2884513602164)
//        }
    }
}

