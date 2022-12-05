import XCTest
import TwentyTwentyTwo

class TestsDay17: XCTestCase {
    
    let input = Input.getInputString(name: "Day17")
        
    let example =  Input.getInputString(name: "Day17Example")
    
    func test_day17_part1_example() {
        XCTAssertEqual(Day17.part1(example), 45)
    }

    func test_day17_part1() {
        XCTAssertEqual(Day17.part1(input), 7750)
    }
    
    func test_day17_example() throws {
        XCTAssertEqual(Day17.part2(example), 112)
    }
    
    func test_day17_part2() {
        XCTAssertEqual(Day17.part2(input), 4120)
    }
}

