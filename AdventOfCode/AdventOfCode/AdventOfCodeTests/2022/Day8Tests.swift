import XCTest
import TwentyTwentyTwo

class TestsDay8: XCTestCase {

    let input = Input.getInputString(name: "Day8")
        .components(separatedBy: "\n")
        .map { string in
            string.components(separatedBy: " | ")
            .map { string in
                return string.components(separatedBy: " ")
            }
        }
        
    let example = Input.getInputString(name: "Day8Example")
        .components(separatedBy: "\n")
        .map { string in
            string.components(separatedBy: " | ")
            .map { string in
                return string.components(separatedBy: " ")
            }
        }
    
    let example2 = "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
            .components(separatedBy: " | ")
            .map { string in
                return string.components(separatedBy: " ")
            }
    
    func test_day8_part1_example() {
        XCTAssertEqual(Day8.part1(example), 26)
    }
    
    func test_day8_part1() {
        XCTAssertEqual(Day8.part1(input), 303)
    }

    func test_day8_part2_example() {
        XCTAssertEqual(Day8.part2(example), 61229)
    }
    
    func test_day8_part2_example2() {
        XCTAssertEqual(Day8.part2([example2]), 5353)
    }

    func test_day8_part2() {
        measure {
            XCTAssertEqual(Day8.part2(input), 961734)
        }
    }
}

