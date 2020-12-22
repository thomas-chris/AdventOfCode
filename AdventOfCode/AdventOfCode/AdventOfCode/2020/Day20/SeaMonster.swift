import Regex

extension TwentyTwenty.Day20 {
    struct SeaMonster {
        public let above  = "                  #"
        public let search = "#    ##    ##    ###"
        public let below  = " #  #  #  #  #  #"
        public let regex = Regex("(#....##....##....###)")
        
        public init() {}
        
        public func abovePoints(tailStart: Position) -> [Position] {
            return [Position(x: tailStart.x + 18, y: tailStart.y - 1)]
        }
        
        public func belowPoints(tailStart: Position) -> [Position] {
            return [
                Position(x: tailStart.x + 1, y: tailStart.y + 1),
                Position(x: tailStart.x + 4, y: tailStart.y + 1),
                Position(x: tailStart.x + 7, y: tailStart.y + 1),
                Position(x: tailStart.x + 10, y: tailStart.y + 1),
                Position(x: tailStart.x + 13, y: tailStart.y + 1),
                Position(x: tailStart.x + 16, y: tailStart.y + 1),
            ]
        }
        
        public func allPoints(tailStart: Position) -> [Position] {
            return [
                tailStart,
                Position(x: tailStart.x + 5, y: tailStart.y),
                Position(x: tailStart.x + 6, y: tailStart.y),
                Position(x: tailStart.x + 11, y: tailStart.y),
                Position(x: tailStart.x + 12, y: tailStart.y),
                Position(x: tailStart.x + 17, y: tailStart.y),
                Position(x: tailStart.x + 18, y: tailStart.y),
                Position(x: tailStart.x + 19, y: tailStart.y),
            ]
            + abovePoints(tailStart: tailStart)
            + belowPoints(tailStart: tailStart)
        }
    }
}
