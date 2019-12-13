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
        let tiles = transform(outputs).tiles
        
        return tiles.filter { (key, value) in
            value == .block}.count
    }
    
    public func part2(memoryOverride: Int, inputs: [Int]) -> Int {
        var changeableList = list
        changeableList[0] = 2
        let intCode = IntCode(list: changeableList)
        var inputs: [Int] = inputs
        
        var allBlocks = (tiles: [Position: Tile](), score: 0)
        var output = [Int]()
        while !intCode.finished {
            intCode.calculate(inputs: inputs)
            output = intCode.output
            allBlocks = transform(output)
            inputs = [getPaddleInput(tiles: allBlocks.tiles)]
        }
        
        return allBlocks.score
    }
}

extension Day13 {
    func transform(_ outputs: [Int]) -> (tiles: [Position: Tile], score: Int) {
        var tiles = [Position: Tile]()
        var score = 0
        for i in stride(from: 0, to: outputs.count, by: 3) {
            if outputs[i] == -1 {
                score = outputs[i+2]
            } else {
            
            let position = Position(x: outputs[i], y: outputs[i+1])
            let block = Tile(rawValue: outputs[i+2])!
            tiles[position] = block
            }
        }
        return (tiles: tiles, score: score)
    }
    
    func getPaddleInput(tiles: [Position: Tile]) -> Int {
        let paddle = tiles.first { $1 == .horizontalPaddle }!.key
        let ball = tiles.first { $1 == .ball }!.key
        
        if (ball.x == paddle.x) {
            return 0
        }
    
        if (ball.x > paddle.x) {
            return 1
        }
        
        if (ball.x < paddle.x) {
            return -1
        }
        
        return 0
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
