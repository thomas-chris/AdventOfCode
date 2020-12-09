import XCTest
import AdventOfCode

class Advent2020TestsDay9: XCTestCase {
    
    func test_day9_example1() {
        let input = Input.array(seperator: "\n", file: "Day92020_Example1")
        
        let game = TwentyTwenty.Day9()
        let count = game.solve1(input: input, consider: 5)
        XCTAssertEqual(count, 127)
    }
    
    
    func test_day9_part1() {
        measure{
            let input = Input.array(seperator: "\n", file: "Day92020")
            
            let game = TwentyTwenty.Day9()
            let count = game.solve1(input: input, consider: 25)
            XCTAssertEqual(count, 1398413738)
        }
    }
    
    func test_day9_example2() {
        measure {
            let input = Input.array(seperator: "\n", file: "Day92020_Example1")
            
            let game = TwentyTwenty.Day9()
            let count = game.solve2(input: input, invalidNumber: 127)
            XCTAssertEqual(count, 62)
        }
    }
    
    func test_day9_part2() {
        measure {
            let input = Input.array(seperator: "\n", file: "Day92020")
            
            let game = TwentyTwenty.Day9()
            let count = game.solve2(input: input, invalidNumber: 1398413738)
            XCTAssertEqual(count, 169521051)
        }
    }
}
