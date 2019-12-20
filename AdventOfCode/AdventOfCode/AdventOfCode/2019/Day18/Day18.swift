//
//  Day18.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 18/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

typealias Maze = [Position: MazeTile]

public class Day18 {
    let input: String
    
    var lockedDoors = [Character: Position]()
    var remainingKeys = [Character: Position]()
    var maze = Maze()
    var collectedKeys = [Character]()
    var start: Position = Position(x: 0, y: 0)
    
    public init(input: String) {
        self.input = input
    }
    
    public func part1() {
        initialise()
        
        let result = Direction.allCases
            .compactMap { traverseMaze(explorer: Explorer(maze: maze, position: start, tile: .entrance, pathLength: 0, lockedDoors: lockedDoors, remainingKeys: remainingKeys), direction: $0)}
        
        print(result)
        
        
    }
    
    func traverseMaze(explorer: Explorer, direction: Direction) -> Int? {
        
        var explorer = explorer
        explorer.move(direction: direction)
        
        switch explorer.tile {
        case .wall:
            return nil
        case .empty:
            return Direction.allCases
                .filter { $0 != direction.opposite }
                .compactMap { traverseMaze(explorer: explorer, direction: $0)}
                .min()
                
        case .entrance:
            return Direction.allCases
            .filter { $0 != direction.opposite }
            .compactMap { traverseMaze(explorer: explorer, direction: $0)}
            .min()
        case .key(_):
            print("should we ever get here?")
            return nil
        case .door(_):
            return nil
        }
    }
    
    func initialise() {
        let lines = input.components(separatedBy: "\n")
        
        for (y, line) in lines.enumerated() {
            for (x, character) in line.enumerated() {
                let position = Position(x: x, y: y)
                let tile: MazeTile
                switch character {
                case "#":
                    tile = .wall
                case "@":
                    tile = .entrance
                    start = position
                case ".":
                    tile = .empty
                case _ where character.isLowercase:
                    tile = .key(character)
                    remainingKeys[character] = position
                case _ where character.isUppercase:
                    tile = .door(character)
                    lockedDoors[character] = position
                default: fatalError()
                }
                
                maze[position] = tile
            }
        }
    }
    
    struct Explorer {
        var maze: Maze
        var position: Position
        var tile: MazeTile
        var pathLength: Int
        var lockedDoors: [Character: Position]
        var remainingKeys: [Character: Position]
        
        mutating func move(direction: Direction) {
            let newPosition = position.move(vector: direction)
            
            guard let newTile = maze[newPosition] else { return }
            switch newTile {
            case .wall:
                break
            case .empty:
                tile = newTile
                pathLength += 1
            case .key(let character):
                if let position = remainingKeys[character] {
                    maze[position] = .empty
                    remainingKeys = remainingKeys.remove(for: character)
                    tile = .empty
                }
                pathLength += 1
            case .door(let character):
                if let _ = remainingKeys[Character(character.lowercased())] {
                    tile = newTile
                    break
                }
                
                if let position = lockedDoors[character] {
                    maze[position] = .empty
                    lockedDoors = lockedDoors.remove(for: character)
                    tile = .empty
                }
                pathLength += 1
                
            case .entrance:
                tile = newTile
                pathLength += 1
            }
        }
    }
}
