import Algorithms
import Foundation
import Regex
import UIKit

public struct Day16 {
    static let hexConvert: [Character: String] = [
        "0": "0000",
        "1": "0001",
        "2": "0010",
        "3": "0011",
        "4": "0100",
        "5": "0101",
        "6": "0110",
        "7": "0111",
        "8": "1000",
        "9": "1001",
        "A": "1010",
        "B": "1011",
        "C": "1100",
        "D": "1101",
        "E": "1110",
        "F": "1111"
    ]
    
    struct Packet {
        let version: Int
        let typeId: Int
        var value = 0
        
        var computedValue: Int  {
            switch typeId {
            case 0:
                return subPackets.map { $0.computedValue }.reduce(0,+)
            case 1:
                return subPackets.map { $0.computedValue }.reduce(1,*)
            case 2:
                return subPackets.map { $0.computedValue }.min()!
            case 3:
                return subPackets.map { $0.computedValue }.max()!
            case 4:
                return value
            case 5:
                return subPackets[0].computedValue > subPackets[1].computedValue ? 1 : 0
            case 6:
                return subPackets[0].computedValue < subPackets[1].computedValue ? 1 : 0
            case 7:
                return subPackets[0].computedValue == subPackets[1].computedValue ? 1 : 0
            default:
                fatalError()
            }
        }
        
        var subPackets: Array<Packet> = []
        
        init(version: Int, typeId: Int) {
            self.version = version
            self.typeId = typeId
        }
    }
    
    public static func part1(_ input: String) -> Int {
        var binaryString = input.map { character in
            hexConvert[character]!
        }.joined(separator: "")
        
        let packet = parse(&binaryString)
        
        return getAllPackets(packet).map { $0.version }.reduce(0, +)
    }
    
    public static func part2(_ input: String) -> Int {
        
        var binaryString = input.map { character in
            hexConvert[character]!
        }.joined(separator: "")
        
        let packet = parse(&binaryString)
        
        return packet.computedValue
    }
    
    private static func parse(_ binaryString: inout String) -> Packet {
        let version = Int(String(binaryString.prefix(3)), radix: 2)!
        let typeId = Int(String(binaryString.dropFirst(3).prefix(3)), radix: 2)!
        var newPacket = Packet(version: version, typeId: typeId)
        binaryString = String(binaryString.dropFirst(6))
        switch typeId {
        case 4:
            ///
            var sub = String(binaryString.prefix(5))
            var valueString = ""
            while sub.first != "0" {
                valueString += String(binaryString.prefix(5).dropFirst())
                binaryString = String(binaryString.dropFirst(5))
                sub = String(binaryString.prefix(5))
            }
            
            valueString += String(binaryString.prefix(5).dropFirst())
            binaryString = String(binaryString.dropFirst(5))
            sub = String(binaryString.prefix(5))
            
            newPacket.value = Int(valueString, radix: 2)!
            return newPacket
        default:
            let I = binaryString.first!
            binaryString = String(binaryString.dropFirst())
            
            if I == "0" {
                let totalLength = Int(String(binaryString.prefix(15)), radix: 2)!
                binaryString = String(binaryString.dropFirst(15))
                var parsed = 0
                
                while parsed < totalLength  {
                    let start = binaryString.count
                    let packet = parse(&binaryString)
                    let end = binaryString.count
                    parsed += (start - end)
                    newPacket.subPackets.append(packet)
                }
            }
            
            if I == "1" {
                let numberSubPackets = Int(String(binaryString.prefix(11)), radix: 2)!
                binaryString = String(binaryString.dropFirst(11))
                for i in 0..<numberSubPackets {
                    newPacket.subPackets.append(parse(&binaryString))
                }
            }
            
            return newPacket
        }
    }
    
    private static func getAllPackets(_ packet: Packet) -> [Packet] {
        var packets = [Packet]()
        packets.append(packet)
        for packet in packet.subPackets {
            packets.append(contentsOf: getAllPackets(packet))
        }
        
        return packets
    }
}
