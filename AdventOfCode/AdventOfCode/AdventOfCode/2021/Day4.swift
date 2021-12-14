import Algorithms
import Foundation
import UIKit

public struct Day4 {

    typealias Board = [[Int]]
    public static func part1(_ input: [String]) -> Int {
        
        let (numbers, boards) = formatData(input)
        return solve(numbers: numbers, boards: boards)
    }
    
    public static func part2(_ input: [String]) throws -> Int {
        var (numbers, boards) = formatData(input)
        
        for i in numbers {
            var newBoards = [[[Int]]]()
            for board in boards {
                var newBoard = [[Int]]()
                for line in board {
                    var newLine = [Int]()
                    newLine = line.compactMap { value in
                        if i == value {
                            return nil
                        }
                        return value
                    }
                    
                    if newLine.count != 0 {
                        newBoard.append(newLine)
                    }
                }
                
                if newBoard.count == 10 {
                    newBoards.append(newBoard)
                }
            }
            if newBoards.count == 1 {
                return solve(numbers: numbers, boards: newBoards)
            }
            boards = newBoards
        }
       return 1
    }
    
    private static func formatData(_ input: [String]) -> ([Int], [Board]) {
        let numbers = input.first!.split(separator: ",").map { String($0) }.compactMap { Int($0) }
        let boards = input.dropFirst().chunks(ofCount: 6).map { lines -> Board in
            let boardLines = Array(lines.dropFirst().map { String($0) })
            let rows = boardLines.map { line -> [Int] in
                return Array(line.split(separator: " ")).map { String($0) }.compactMap { Int($0) }
            }
            
            var columns: [[Int]] = []
            for i in 0..<5 {
                var column: [Int?] = []
                for j in 0..<5 {
                    column.append(Int(rows[j][i]))
                }
                columns.append(column.compactMap {$0 })
            }
            return rows + columns
            
        }
        
        return (numbers, boards)
    }
    
    private static func solve(numbers: [Int], boards: [[[Int]]]) -> Int {
        var finish = false
        var finalNum = Int.max
        var finalBoard = [[Int]]()
        var boards = boards
        
        for i in numbers {
            var newBoards = [[[Int]]]()
            for board in boards {
                var newBoard = [[Int]]()
                for line in board {
                    var newLine = [Int]()
                    newLine = line.compactMap { value in
                        if i == value {
                            return nil
                        }
                        return value
                    }
                    
                    if newLine.count == 0 {
                        finalNum = i
                        finish = true
                    }
                    newBoard.append(newLine)
                }
                if finish == true {
                    finalBoard = newBoard
                    return finalNum * (finalBoard.map { $0.reduce(0, +) }.reduce(0, +) / 2)
                }
                newBoards.append(newBoard)
            }
            boards = newBoards
        }
       return 1
    }
}
