import XCTest
import AdventOfCode

class Advent2020TestsDay10: XCTestCase {
    
    func test_day10_example1() {
        let input = Input.array(seperator: "\n", file: "Day102020_Example1")
        
        let game = TwentyTwenty.Day10()
        let count = game.solve1(input: input)
        XCTAssertEqual(count, 35)
    }
    
    func test_day10_example2() {
        let input = Input.array(seperator: "\n", file: "Day102020_Example2")
        
        let game = TwentyTwenty.Day10()
        let count = game.solve1(input: input)
        XCTAssertEqual(count, 220)
    }
    

    func test_day10_part1() {
        measure{
            let input = Input.array(seperator: "\n", file: "Day102020")

            let game = TwentyTwenty.Day10()
            let count = game.solve1(input: input)
            XCTAssertEqual(count, 2592)
        }
    }
    
    func test_day10_part2_example1() {
        let input = Input.array(seperator: "\n", file: "Day102020_Example1")
        
        let game = TwentyTwenty.Day10()
        let count = game.solve2(input: input)
        XCTAssertEqual(count, 8)
    }
    
    func test_day10_part2_example2() {
        let input = Input.array(seperator: "\n", file: "Day102020_Example2")
        
        let game = TwentyTwenty.Day10()
        let count = game.solve2(input: input)
        XCTAssertEqual(count, 19208)
    }

    func test_day10_part2() {
        measure{
            let input = Input.array(seperator: "\n", file: "Day102020")

            let game = TwentyTwenty.Day10()
            let count = game.solve2(input: input)
            XCTAssertEqual(count, 198428693313536)
        }
    }
}
