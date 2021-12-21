import Foundation

public struct Day20 {
    
    public static func part1(_ input: [String], times: Int) -> Int {
        
        var input = input
        var algorithm = [Int]()
        
        let row = input.first!
        for char in row {
            let int = char == "." ? 0 : 1
            algorithm.append(int)
        }
        
        let inputImage = Array(input.dropFirst(2))
        let thing = inputImage.map { value -> String in
            var row = ""
            value.forEach { char in
                
                row.append(char == "." ? "0" : "1")
            }
            
            return row
        }
        var image = Grid(thing)
        var infiniteValue = false
        
        for i in 0 ..< times {
            image = useAlgorithm(image, algorithm: algorithm, infiniteValue: infiniteValue)
            if algorithm.first == 1 {
                infiniteValue.toggle()
            }
        }
        
        return image.grid.values.filter { int in
            int == 1
        }.count
    }
    
    public static func part2(_ input: [String]) -> Int {
        return 1
    }
    
    private static func useAlgorithm(_ image: Grid, algorithm: [Int], infiniteValue: Bool) -> Grid {
        let xRangeValues = image.xRange
        let yRangeValues = image.yRange
        
        let xRange = (xRangeValues.0 - 1) ... (xRangeValues.1 + 1)
        let yRange = (yRangeValues.0 - 1) ... (yRangeValues.1 + 1)

        let copy = Grid([])

        for x in xRange {
            for y in yRange {
                let p = Position(x: x, y: y)
                let window = p.window

                let bits = window.map { image.grid[$0] ?? (infiniteValue ? 1 : 0) }.map { "\($0)"}.joined()
                let index = Int(bits, radix: 2)!
                copy.grid[p] = algorithm[index]
            }
        }
        
        return copy
    }
    
}
