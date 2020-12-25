import XCTest
import AdventOfCode

class Advent2020TestsDay25: XCTestCase {
    
        func test_day25_part1_example() {
            let cardKey = 5764801
            let doorKey = 17807724
            
            let day25 = TwentyTwenty.Day25()
            let value = day25.solvePart1(cardKey: cardKey, doorKey: doorKey)
            XCTAssertEqual(value, 14897079)
        }
    
    func test_day25_part1() {
        //        measure {
        let cardKey = 1327981
        let doorKey = 2822615
        
        let day25 = TwentyTwenty.Day25()
        let value = day25.solvePart1(cardKey: cardKey, doorKey: doorKey)
        XCTAssertEqual(value, 10187657)
        //        }
    }
}
