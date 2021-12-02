import XCTest
import TwentyTwentyOne

class TestsDay2: XCTestCase {

    func test_day2_part1() {
        XCTAssertEqual(Day2.getAnswerPart1(), 1451208)
    }
    
    func test_day2_example() {
        XCTAssertEqual(Day2.getAnswerPart2Example(), 900)
    }
    
    func test_day2_part2() {
        XCTAssertEqual(Day2.getAnswerPart2(), 1620141160)
    }
}

