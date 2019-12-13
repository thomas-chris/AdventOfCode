//
//  Day13.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 13/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

public class Day13 {
    public let list: [Int: Int]
    
    public init(list: [Int: Int]) {
        self.list = list
    }
    
    public func part1(inputs: [Int]) -> Int {
        let intCode = IntCode(list: list)
        intCode.calculate(inputs: inputs)
        
        if intCode.finished {
            print("IntCode prog finished")
        }
        
        let outputs = intCode.output
        let tiles = transform(outputs)
        
        return tiles.filter { $0.tile == .block}.count
    }
}

extension Day13 {
    func transform(_ outputs: [Int]) -> [BlockBreakTile] {
        var tiles = [BlockBreakTile]()
        for i in stride(from: 0, to: outputs.count, by: 3) {
            let position = Position(x: outputs[i], y: outputs[i+1])
            let block = Tile(rawValue: outputs[i+2])!
            tiles.append(BlockBreakTile(position: position, tile: block))
        }
        return tiles
    }
}


public struct BlockBreakTile {
    public let position: Position
    public let tile: Tile
    
    public init(position: Position, tile: Tile) {
        self.position = position
        self.tile = tile
    }
}
