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
        XCTAssertEqual(Day16.part1(example), 6)
    }
    
    func test_day16_part1_example2() {
        XCTAssertEqual(Day16.part1(example2), 9)
    }
    
    func test_day16_part1_example3() {
        XCTAssertEqual(Day16.part1(example3), 14)
    }
    
    func test_day16_part1_example4() {
        XCTAssertEqual(Day16.part1(example4), 16)
    }
    
    func test_day16_part1_example5() {
        XCTAssertEqual(Day16.part1(example5), 12)
    }
    
    func test_day16_part1_example6() {
        XCTAssertEqual(Day16.part1("C0015000016115A2E0802F182340"), 23)
    }
    
    func test_day16_part1_example7() {
        XCTAssertEqual(Day16.part1("A0016C880162017C3686B18A3D4780"), 31)
    }

    func test_day16_part1() {
        XCTAssertEqual(Day16.part1(input), 936)
    }
    
    func test_day16_part2_example() {
        XCTAssertEqual(Day16.part2("C200B40A82"), 3)
    }
    
    func test_day16_part2_example2() {
        XCTAssertEqual(Day16.part2("04005AC33890"), 54)
    }
    
    func test_day16_part2_example3() {
        XCTAssertEqual(Day16.part2("880086C3E88112"), 7)
    }
    
    func test_day16_part2_example4() {
        XCTAssertEqual(Day16.part2("CE00C43D881120"), 9)
    }
    
    func test_day16_part2_example5() {
        XCTAssertEqual(Day16.part2("D8005AC2A8F0"), 1)
    }
    
    func test_day16_part2_example6() {
        XCTAssertEqual(Day16.part2("9C0141080250320F1802104A08"), 1)
    }
    
    func test_day16_part2() throws {
        measure {
            XCTAssertEqual(Day16.part2(input), 6802496672062)
        }
    }
}

