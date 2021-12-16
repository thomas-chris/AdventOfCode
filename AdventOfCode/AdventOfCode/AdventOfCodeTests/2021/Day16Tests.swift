import XCTest
import TwentyTwentyOne

class TestsDay16: XCTestCase {

    let input = Input.getInputString(name: "Day16")
        
    let example =  Input.getInputString(name: "Day16Example")
    let example2 =  Input.getInputString(name: "Day16Example2")
    let example3 =  Input.getInputString(name: "Day16Example3")
    let example4 =  Input.getInputString(name: "Day16Example4")
    let example5 =  Input.getInputString(name: "Day16Example5")
    
    func test_day16_part1_example() {
        XCTAssertEqual(Day16.part1(example), 40)
    }
    
    func test_day16_part1_example2() {
        XCTAssertEqual(Day16.part1(example2), 40)
    }
    
    func test_day16_part1_example3() {
        XCTAssertEqual(Day16.part1(example3), 6)
    }
    
    func test_day16_part1_example4() {
        XCTAssertEqual(Day16.part1(example4), 16)
    }
    
    func test_day16_part1_example5() {
        XCTAssertEqual(Day16.part1(example5), 16)
    }

    func test_day16_part1() {
        XCTAssertEqual(Day16.part1(input), 537)
    }
    
    func test_day16_example() throws {
        XCTAssertEqual(Day16.part2(example), 316)
    }
    
    func test_day16_part2() throws {
//        measure {
        XCTAssertEqual(Day16.part2(input), 2881)
//        }
    }
}

