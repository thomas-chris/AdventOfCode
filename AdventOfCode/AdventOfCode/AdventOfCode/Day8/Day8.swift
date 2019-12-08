//
//  Day8.swift
//  AdventOfCode
//
//  Created by Chris Thomas on 08/12/2019.
//  Copyright © 2019 Chris Thomas. All rights reserved.
//

import Foundation

class Day8 {
    
    let input: String
    
    init(input: String) {
        self.input = input
    }
    
    func part1(width: Int, height: Int) -> Int {
        let layers = buildLayers(width: width, height: height)
        let layer = getLayerWithFewest0s(layers: layers)
        let ones = layer.lines.map { $0.count(of: "1") }.reduce(0, +)
        let twos = layer.lines.map { $0.count(of: "2") }.reduce(0, +)
        return twos * ones
    }
    
    func part2(width: Int, height: Int) -> [String] {
        return buildLayers2(width: width, height: height)
    }

    func buildLayers(width: Int, height: Int) -> [Layer] {
        
        let lines = input.split(by: width)
        var layers: [Layer] = []
        for i in stride(from: 0, to: lines.count, by: height) {
            var newlines: [String] = []
            
            for j in 0..<height {
                newlines.append(lines[i + j])
            }
            let layer = Layer(lines: newlines)
            layers.append(layer)
        }
        
        return layers
    }
    
    func buildLayers2(width: Int, height: Int) -> [String] {
        let lines = input.split(by: width * height)
        
        var newArray = lines.first!.map { String($0) }
        
        var iterator = lines.dropFirst().makeIterator()
        var count = 0
        while let value = iterator.next() {
            value.enumerated().forEach { (index, character) in
                newArray[index] = String(newArray[index]) + String(character)
            }
            count += 1
        }
        
        let reducedInput = newArray.map { value -> String in
            let first0 = value.firstIndex(of: "0")
            let first1 = value.firstIndex(of: "1")
            
            if first0 == nil && first1 == nil {
                return " "
            } else if first0 == nil {
                return "◼️"
            } else if first1 == nil {
                return "◻️"
            } else if first0! < first1! {
                return "◻️"
            } else {
                return "◼️"
            }
            
        }
        
        let split = reducedInput.split(by: width)
        let rows = split.map { value in
            value.reduce("", +)
        }
        return rows
    }
    
    
    
    func getLayerWithFewest0s(layers: [Layer]) -> Layer {
        var fewest0s: Int = Int.max
        var layerWithFewest0s: Layer?
        
        layers.forEach { layer in
            var string = ""
            layer.lines.forEach { value in
                string += value
            }
            
            let count = string.count(of: "0")
            if count < fewest0s {
                layerWithFewest0s = layer
                fewest0s = count
            }
        }
        
        return layerWithFewest0s!
    }
}

struct Layer {
    let lines: [String]
}

extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [String]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(String(self[startIndex..<endIndex]))
            startIndex = endIndex
        }

        return results
    }
    
    func count(of character: Character) -> Int {
        return reduce(0) {
            $1 == character ? $0 + 1 : $0
        }
    }
}

extension Array where Element == String {
    func split(by length: Int) -> [[String]] {
        var startIndex = self.startIndex
        var results = [[String]]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append([String](self[startIndex..<endIndex]))
            startIndex = endIndex
        }

        return results
    }
}

