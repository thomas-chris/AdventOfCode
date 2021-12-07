import XCTest
import TwentyTwentyOne

class TestsDay7: XCTestCase {

    let input = Array(Input.array(seperator: ",", file: "Day7", compactmap:  { string in Int(string.replacingOccurrences(of: "\n", with: ""))! } ))
        
    let example = Array(Input.array(seperator: ",", file: "Day7Example", compactmap:  { string in Int(string.replacingOccurrences(of: "\n", with: ""))! } ))
    
    func test_day7_part1_example() throws {
        XCTAssertEqual(Day7.part1(example), 37)
    }
    
    func test_day7_part1() {
        XCTAssertEqual(Day7.part1(input), 336131)
    }

    func test_day7_part2_example() throws {
        XCTAssertEqual(try Day7.part2(example), 168)
    }

    func test_day7_part2() throws {
        measure {
            XCTAssertEqual(try? Day7.part2(input), 92676646)
        }
    }
}

