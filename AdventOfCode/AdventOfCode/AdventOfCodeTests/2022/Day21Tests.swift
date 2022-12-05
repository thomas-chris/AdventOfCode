import XCTest
import TwentyTwentyTwo

class TestsDay21: XCTestCase {
    
    func test_day1_part1() {
        XCTAssertEqual(Day21.part1(p1Start: 1, p2Start: 6), 604998)
    }
    
    func test_day1_part2() {
        XCTAssertEqual(Day21.part2(p1Start: 1, p2Start: 6), 157253621231420)
    }
}

