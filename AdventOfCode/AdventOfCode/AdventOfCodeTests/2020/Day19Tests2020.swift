import XCTest
import AdventOfCode

class Advent2020TestsDay19: XCTestCase {
    
    func test_day19_example1() throws {
        let input = Input.getInputString(name: "Day192020_Example1").components(separatedBy: "\n\n")
        let day19 = TwentyTwenty.Day19()
        let value = try day19.solvePart1(input: input)
        XCTAssertEqual(value, 2)

    }
    
    func test_day19_part1() {
        measure {
            let input = Input.getInputString(name: "Day192020").components(separatedBy: "\n\n")
            let day19 = TwentyTwenty.Day19()
            do {
            let value = try day19.solvePart1(input: input)
            XCTAssertEqual(value, 216)
            } catch {}
        }
    }
    
//    func test_day19_2_example1() throws {
//        let input = Input.getInputString(name: "Day192020_Example2").components(separatedBy: "\n\n")
//        let day19 = TwentyTwenty.Day19()
//        let value = try day19.solvePart2(input: input)
//        XCTAssertEqual(value, 231)
//
//    }
    
    func test_day19_part2() {
        measure {
        let input = Input.getInputString(name: "Day192020").components(separatedBy: "\n\n")
        let day19 = TwentyTwenty.Day19()
        do {
        let value = try day19.solvePart2(input: input)
        XCTAssertEqual(value, 400)
        } catch {}
        }
    }


    func test_day19_noRegex() throws {
        let input = Input.getInputString(name: "Day192020_Example1").components(separatedBy: "\n\n")
        let day19 = TwentyTwenty.Day19_NoRegex()
        let value = try day19.solvePart1(input: input)
        XCTAssertEqual(value, 2)

    }
}
