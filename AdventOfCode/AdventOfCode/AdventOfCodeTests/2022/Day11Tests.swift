import XCTest
import TwentyTwentyTwo

class TestsDay11: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day11", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day11Example", compactmap:  { string in string } ).dropLast())
    
    func test_day11_part1_example() {
        XCTAssertEqual(Day11.part1(example, turns: 100), 1656)
    }
    
    func test_day11_part1() {
        XCTAssertEqual(Day11.part1(input, turns: 100), 1649)
    }
    
    func test_day11_example() throws {
        XCTAssertEqual(try Day11.part2(example), 195)
    }
    
    func test_day11_part2() throws {
        measure {
            XCTAssertEqual(try? Day11.part2(input), 256)
        }
    }
}

