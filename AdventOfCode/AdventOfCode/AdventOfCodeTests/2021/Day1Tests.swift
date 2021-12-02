import XCTest
import TwentyTwentyOne

class TestsDay1: XCTestCase {
    
    let input = Input.array(seperator: "\n", file: "Day1", compactmap: { string in Int(string) }).compactMap { $0 }
    
    func test_day1_part1() {
        XCTAssertEqual(Day1.getAnswerPart1(input: input), 1715.0)
    }
    
    func test_day1_part2() {
        XCTAssertEqual(Day1.getAnswerPart2(input: input), 1739.0)
    }
}

