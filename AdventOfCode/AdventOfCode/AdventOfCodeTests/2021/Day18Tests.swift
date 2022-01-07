import XCTest
import TwentyTwentyOne

class TestsDay18: XCTestCase {
    
    let input = Array(Input.array(seperator: "\n", file: "Day18", compactmap:  { string in string } ).dropLast())
        
    let example = Array(Input.array(seperator: "\n", file: "Day18Example", compactmap:  { string in string } ).dropLast())
    
    func test_day18_part1_example() {
        XCTAssertEqual(Day18.part1(example).0, 4140)
    }
    
    func test_reduceExplode_1() {
        let fish = Fish("[[[[[9,8],1],2],3],4]")
        let new = Fish.reduceExplode(fish)
        XCTAssertEqual(new.0, Fish("[[[[0,9],2],3],4]"))
    }
    
    func test_reduceExplode_2() {
        let fish = Fish("[7,[6,[5,[4,[3,2]]]]]")
        let new = Fish.reduceExplode(fish)
        XCTAssertEqual(new.0, Fish("[7,[6,[5,[7,0]]]]"))
    }
    
    func test_reduceExplode_3() {
        let fish = Fish("[[6,[5,[4,[3,2]]]],1]")
        let new = Fish.reduceExplode(fish)
        XCTAssertEqual(new.0, Fish("[[6,[5,[7,0]]],3]"))
    }
    
    func test_reduceExplode_4() {
        let fish = Fish("[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]")
        let new = Fish.reduceExplode(fish)
        XCTAssertEqual(new.0, Fish("[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]"))
    }
    
    func test_reduceExplode_5() {
        let fish = Fish("[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]")
        let new = Fish.reduceExplode(fish)
        XCTAssertEqual(new.0, Fish("[[3,[2,[8,0]]],[9,[5,[7,0]]]]"))
    }
    
    func test_reduceExplodeAndSplit() {
        let fish1 = Fish("[[[[4,3],4],4],[7,[[8,4],9]]]")
        let fish2 = Fish("[1,1]")
        
        let newFish = Fish.addFish(fish1, fish2)
        
        XCTAssertEqual(newFish, Fish("[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]"))
        
        var new = Fish.reduceExplode(newFish)
        
        XCTAssertEqual(new.0, Fish("[[[[0,7],4],[7,[[8,4],9]]],[1,1]]"))
        
        new = Fish.reduceExplode(new.0)
        XCTAssertEqual(new.0.description, Fish("[[[[0,7],4],[15,[0,13]]],[1,1]]").description)
        
        new = Fish.reduceSplit(new.0)
        XCTAssertEqual(new.0.description, Fish("[[[[0,7],4],[[7,8],[0,13]]],[1,1]]").description)
        
        new = Fish.reduceSplit(new.0)
        XCTAssertEqual(new.0.description, Fish("[[[[0,7],4],[[7,8],[0,[6,7]]]],[1,1]]").description)
        
        new = Fish.reduceExplode(new.0)
        XCTAssertEqual(new.0.description, Fish("[[[[0,7],4],[[7,8],[6,0]]],[8,1]]").description)
        
        let result = Day18.part1(["[[[[4,3],4],4],[7,[[8,4],9]]]", "[1,1]"])
        XCTAssertEqual(new.0.description, result.1)
    }

    func test_largeExample_part1() {
        let result = Day18.part1(["[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]", "[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]"])
        XCTAssertEqual(Fish("[[[[4,0],[5,4]],[[7,7],[6,0]]],[[8,[7,7]],[[7,9],[5,0]]]]").description, result.1)
    }
    
    func test_magnitude_1() {
        XCTAssertEqual(Fish("[[1,2],[[3,4],5]]").magnitude, 143)
    }
    
    func test_magnitude_2() {
        XCTAssertEqual(Fish("[[[[0,7],4],[[7,8],[6,0]]],[8,1]]").magnitude, 1384)
    }
    
    func test_magnitude_3() {
        XCTAssertEqual(Fish("[[[[5,0],[7,4]],[5,5]],[6,6]]").magnitude, 1137)
    }
    
    func test_magnitude_4() {
        XCTAssertEqual(Fish("[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]").magnitude, 3488)
    }
    
    func test_day18_part1() {
        XCTAssertEqual(Day18.part1(input).0, 3654)
    }
    
    func test_day18_example() throws {
        XCTAssertEqual(Day18.part2(example), 3993)
    }
    
    func test_day18_part2() {
        XCTAssertEqual(Day18.part2(input), 4578)
    }
   
}

