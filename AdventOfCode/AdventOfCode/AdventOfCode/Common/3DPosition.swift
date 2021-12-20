import Foundation

public struct ThreeDPosition: Hashable {
    let x: Int
    let y: Int
    let z: Int
    
    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    func move(by vector: ThreeDVector) -> ThreeDPosition {
        ThreeDPosition(x: self.x + vector.x, y: self.y + vector.y, z: self.z + vector.z)
    }
    
    func vector(to position: ThreeDPosition) -> ThreeDVector {
        ThreeDVector(x: position.x - self.x, y: position.y - self.y, z: position.z - self.z)
    }
    
    func manhattan(to position: ThreeDPosition) -> Int {
        abs(self.x - position.x) + abs(self.y - position.y) + abs(self.z - position.z)
    }
}


public struct ThreeDVector: Hashable {
    let x: Int
    let y: Int
    let z: Int
    
    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
}
