import XCTest
import TwentyTwentyOne

class TestsDay3: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day3", compactmap:  { string in Array(string) } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day3Example", compactmap:  { string in Array(string) } ).dropLast())
    
    func test_day3_part1_example() {
        XCTAssertEqual(Day3.part1(example), 198)
    }
    
    func test_day3_part1() {
        XCTAssertEqual(Day3.part1(input), 1131506)
    }
    
    func test_day3_example() throws {
        XCTAssertEqual(try Day3.part2(example), 230)
    }
    
    func test_day3_part2() throws {
        measure {
            XCTAssertEqual(try? Day3.part2(input), 7863147)
        }
    }
    
    func test_day3_part1_transpose() {
        Day3.part1_transpose(example)
    }
}

