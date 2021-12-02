import XCTest
import TwentyTwentyOne

class TestsDay2: XCTestCase {

    let input = Array(Input.array(seperator: "\n", file: "Day2", compactmap:  { string in string } ).dropLast())
        .map { string -> (String, Int) in
            let substrings = string.split(separator: " ")
            return (String(substrings[0]), Int(substrings[1]) ?? 0)
        }
    let example = Array(Input.array(seperator: "\n", file: "Day2Example", compactmap:  { string in string } ).dropLast())
        .map { string -> (String, Int) in
            let substrings = string.split(separator: " ")
            return (String(substrings[0]), Int(substrings[1]) ?? 0)
        }
    
    func test_day2_part1() {
        XCTAssertEqual(Day2.getAnswerPart1(input: input), 1451208)
    }
    
    func test_day2_example() {
        XCTAssertEqual(Day2.part2(example), 900)
    }
    
    func test_day2_part2() {
        XCTAssertEqual(Day2.part2(input), 1620141160)
    }
}

