import Foundation

public struct Day19 {
    
    
    public static var allTransforms: [(ThreeDPosition) -> ThreeDPosition] {
        [
            { ThreeDPosition(x:  $0.x, y:  $0.y, z:  $0.z) },
            { ThreeDPosition(x:  $0.x, y:  $0.z, z: -$0.y) },
            { ThreeDPosition(x:  $0.x, y: -$0.y, z: -$0.z) },
            { ThreeDPosition(x:  $0.x, y: -$0.z, z:  $0.y) },
            { ThreeDPosition(x:  $0.y, y:  $0.x, z: -$0.z) },
            { ThreeDPosition(x:  $0.y, y:  $0.z, z:  $0.x) },
            { ThreeDPosition(x:  $0.y, y: -$0.x, z:  $0.z) },
            { ThreeDPosition(x:  $0.y, y: -$0.z, z: -$0.x) },
            { ThreeDPosition(x:  $0.z, y:  $0.x, z:  $0.y) },
            { ThreeDPosition(x:  $0.z, y:  $0.y, z: -$0.x) },
            { ThreeDPosition(x:  $0.z, y: -$0.x, z: -$0.y) },
            { ThreeDPosition(x:  $0.z, y: -$0.y, z:  $0.x) },
            { ThreeDPosition(x: -$0.x, y:  $0.y, z: -$0.z) },
            { ThreeDPosition(x: -$0.x, y:  $0.z, z:  $0.y) },
            { ThreeDPosition(x: -$0.x, y: -$0.y, z:  $0.z) },
            { ThreeDPosition(x: -$0.x, y: -$0.z, z: -$0.y) },
            { ThreeDPosition(x: -$0.y, y:  $0.x, z:  $0.z) },
            { ThreeDPosition(x: -$0.y, y:  $0.z, z: -$0.x) },
            { ThreeDPosition(x: -$0.y, y: -$0.x, z: -$0.z) },
            { ThreeDPosition(x: -$0.y, y: -$0.z, z:  $0.x) },
            { ThreeDPosition(x: -$0.z, y:  $0.x, z: -$0.y) },
            { ThreeDPosition(x: -$0.z, y:  $0.y, z:  $0.x) },
            { ThreeDPosition(x: -$0.z, y: -$0.x, z:  $0.y) },
            { ThreeDPosition(x: -$0.z, y: -$0.y, z: -$0.x) },
        ]
    }
    
    public static func part1(_ input: [String]) -> (Int, Int) {
        
        var index = 0
        var scanners = [Scanner]()
        for line in input {
            if line.prefix(3) == "---" {
                let scanner = Scanner(scannerNumber: index, beacons: [], scanners: [])
                scanners.append(scanner)
                index += 1
            } else if !line.isEmpty {
                let coords = line.split(separator: ",").compactMap { Int($0) }
                var scanner = scanners.removeLast()
                scanner.beacons.insert(ThreeDPosition(x: coords[0], y: coords[1], z: coords[2]))
                scanners.append(scanner)
            }
        }
        
        var origin = scanners.removeFirst()
        origin.scanners.insert(ThreeDPosition(x: 0, y: 0, z: 0))
        while let unmatchedScanner = scanners.first {
            _ = scanners.removeFirst()
            var matched = false
            
matched:    for beacon in origin.beacons {
                let originVectors = Set(origin.vectors(from: beacon))
                for unknownBeacon in unmatchedScanner.beacons {
                    for transform in allTransforms {
                        let newBeacon = transform(unknownBeacon)
                        let transformedScanner = unmatchedScanner.apply(transform)
                        let transformedVectors = Set(transformedScanner.vectors(from: newBeacon))
                        let intersection = originVectors.intersection(transformedVectors)
                        if intersection.count >= 6 {
                            matched = true
                            let offset = newBeacon.vector(to: beacon)
                            let translatedBeacons = transformedScanner.beacons.map { $0.move(by: offset) }
                            origin.beacons.formUnion(translatedBeacons)
                            origin.scanners.insert(ThreeDPosition(x: 0, y: 0, z: 0).move(by: offset))
                            break matched
                        }
                    }
                }
            }
            
            if !matched {
                scanners.append(unmatchedScanner)
            }
        }
    
        let scannerCombos = origin.scanners.combinations(ofCount: 2)
        let max = scannerCombos.map { positions in
            positions[0].manhattan(to: positions[1])
        }.max()!
        
        
        return (origin.beacons.count, max)
}

public static func part2(_ input: [String]) -> Int {
    return 1
}
}

struct Scanner {
    let scannerNumber: Int
    var beacons: Set<ThreeDPosition>
    var scanners: Set<ThreeDPosition>
    
    func vectors(from position: ThreeDPosition) -> Array<ThreeDVector> {
        return beacons.compactMap { otherPosition -> ThreeDVector? in
            guard otherPosition != position else { return nil }
            return otherPosition.vector(to: position)
        }
    }
    
    func apply(_ transform: (ThreeDPosition) -> ThreeDPosition) -> Scanner {
        return Scanner(scannerNumber: scannerNumber, beacons: Set(beacons.map(transform)), scanners: [])
    }
}
