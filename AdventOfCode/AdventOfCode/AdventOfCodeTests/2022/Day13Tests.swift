import XCTest
import TwentyTwentyTwo

class TestsDay13: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day13", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day13Example", compactmap:  { string in string } ).dropLast())

    func test_day13_part1_example() {
        XCTAssertEqual(Day13.part1(example), 17)
    }

    func test_day13_part1() {
        XCTAssertEqual(Day13.part1(input), 693)
    }
    
    func test_day13_example() {
        Day13.part2(example)
    }
    
    func test_day13_part2() {
//        measure {
            Day13.part2(input)
//        }
    }
}

