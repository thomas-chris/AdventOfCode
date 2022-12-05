import XCTest
import TwentyTwentyTwo

class TestsDay10: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day10", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day10Example", compactmap:  { string in string } ).dropLast())
    
    func test_day10_part1_example() {
        XCTAssertEqual(Day10.part1(example), 26397)
    }
    
    func test_day10_part1() {
        XCTAssertEqual(Day10.part1(input), 339411)
    }
    
    func test_day10_example() throws {
        XCTAssertEqual(try Day10.part2(example), 288957)
    }
    
    func test_day10_part2() throws {
        measure {
            XCTAssertEqual(try? Day10.part2(input), 2289754624)
        }
    }
}

