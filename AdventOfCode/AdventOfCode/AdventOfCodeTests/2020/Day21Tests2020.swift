import XCTest
import AdventOfCode

class Advent2020TestsDay21: XCTestCase {
    
    func test_day21_part1() {
        measure {
            let input = Input.getInputString(name: "Day212020").components(separatedBy: "\n")
            let day21 = TwentyTwenty.Day21()
            let value = day21.solvePart1(input: input)
            XCTAssertEqual(value, 2098)
        }
    }
    
    func test_day21_part2() {
        measure {
            let input = Input.getInputString(name: "Day212020").components(separatedBy: "\n")
            let day21 = TwentyTwenty.Day21()
            let value = day21.solvePart2(input: input)
            XCTAssertEqual(value, "ppdplc,gkcplx,ktlh,msfmt,dqsbql,mvqkdj,ggsz,hbhsx")
        }
    }
}
