import XCTest
import TwentyTwentyTwo

class TestsDay1: XCTestCase {
    
    let input = Input.array(seperator: "\n\n", file: "Day1", compactmap: { $0 })
        .map { $0.components(separatedBy: "\n").compactMap(Int.init) }
    
    func test_day1_part1() {
        XCTAssertEqual(Day1.getAnswerPart1(input: input), 69912)
    }
    
    func test_day1_part2() {
        XCTAssertEqual(Day1.getAnswerPart2(input: input), 208180)
    }
}

