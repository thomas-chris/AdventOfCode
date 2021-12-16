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
        var value: Int = 0
        var subPackets: Array<Packet> = []
        
        init(version: Int, typeId: Int, value: Int) {
            self.version = version
            self.typeId = typeId
            self.value = value
        }
        
        init(version: Int, typeId: Int) {
            self.version = version
            self.typeId = typeId
        }
        
        
    }
    
    public static func part1(_ input: String) -> Int {
        let binaryString = input.map { character in
            hexConvert[character]!
        }.joined(separator: "")
        
        let packet = parse(binaryString, packet: nil).1
        
        return getAllPackets(packet).map { $0.version }.reduce(0, +)
    }
    
    public static func part2(_ input: String) -> Int {
        return 1
    }
    
    private static func parse(_ binaryString: String, packet: Packet?) -> (String, Packet) {
        let version = Int(String(binaryString.prefix(3)), radix: 2)!
        let typeId = Int(String(binaryString.dropFirst(3).prefix(3)), radix: 2)!
        var newPacket = Packet(version: version, typeId: typeId)
        var subString = String(binaryString.dropFirst(6))
        switch typeId {
        case 4:
            ///
            var sub = String(subString.prefix(5))
            var valueString = ""
            while sub.first != "0" {
                valueString += String(subString.prefix(5).dropFirst())
                subString = String(subString.dropFirst(5))
                sub = String(subString.prefix(5))
            }
            
            valueString += String(subString.prefix(5).dropFirst())
            subString = String(subString.dropFirst(5))
            sub = String(subString.prefix(5))
            
            newPacket.value = Int(valueString, radix: 2)!
            return (subString, newPacket)
        default:
            let I = subString.first!
            subString = String(subString.dropFirst())
            
            if I == "0" {
                let totalLength = Int(String(subString.prefix(15)), radix: 2)!
                subString = String(subString.dropFirst(15))
                while subString.contains("1") {
                    let packet = parse(subString, packet: newPacket)
                    newPacket.subPackets.append(packet.1)
                    subString = packet.0
                }
                
                return (subString, newPacket)
            }
            
            if I == "1" {
                let numberSubPackets = Int(String(subString.prefix(11)), radix: 2)!
                subString = String(subString.dropFirst(11))
                for i in 1...numberSubPackets {
                    let packet = parse(String(subString), packet: newPacket)
                    subString = packet.0
                    newPacket.subPackets.append(packet.1)
                }
                
                return (subString, newPacket)
            }
            
            return (subString, newPacket)
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
