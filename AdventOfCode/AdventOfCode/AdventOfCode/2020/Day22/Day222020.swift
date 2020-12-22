import Algorithms

extension TwentyTwenty {
    public class Day22 {
        public init() {
        }
    }
}

extension TwentyTwenty.Day22 {
    public func solvePart1(input: [String]) -> Int {
        
        var player1 = input[0].components(separatedBy: "\n")
            .compactMap { Int($0) }
        var player2 = input[1].components(separatedBy: "\n")
            .compactMap { Int($0) }
        
        while player1.count > 0 && player2.count > 0 {
            let p1 = player1.first!
            let p2 = player2.first!
            player1 = Array(player1.dropFirst())
            player2 = Array(player2.dropFirst())
            
            if p1 > p2 {
                player1.append(contentsOf: [p1, p2])
            }
            
            if p2 > p1 {
                player2.append(contentsOf: [p2, p1])
            }
        }
        
        var winningHand: [Int]
        if player2.count == 0 {
            winningHand = player1
        } else {
            winningHand = player2
        }
        
        return winningHand.reversed().enumerated().reduce(0) { (result, arg1) -> Int in
            
            let (index, value) = arg1
            return result + value * (index + 1)
        }
    }
    
    public func solvePart2(input: [String]) -> Int {
        
        let player1 = input[0].components(separatedBy: "\n")
            .compactMap { Int($0) }
        let player2 = input[1].components(separatedBy: "\n")
            .compactMap { Int($0) }
        
        let (player1Won, player1Hand, player2Hand) = playGame(player1: player1, player2: player2)
        
        var winningHand: [Int]
        if player1Won {
            winningHand = player1Hand
        } else {
            winningHand = player2Hand
        }
        
        return winningHand.reversed().enumerated().reduce(0) { (result, arg1) -> Int in
            
            let (index, value) = arg1
            return result + value * (index + 1)
        }
        
    }
    private func playGame(player1: [Int], player2: [Int]) -> (Bool, [Int], [Int]) {
        
        var previousHands = Set<[[Int]]>()
        var player1 = player1
        var player2 = player2
        var hasWon = false
        
        while player1.count > 0 && player2.count > 0 && !hasWon {
            let p1 = player1.first!
            let p2 = player2.first!
            
            if previousHands.contains([player1, player2]) {
                hasWon = true
                return (true, player1, player2)
            }
            previousHands.insert([player1, player2])
            
            player1 = Array(player1.dropFirst())
            player2 = Array(player2.dropFirst())

            if p1 <= player1.count && p2 <= player2.count {
                if playGame(player1: Array(player1.prefix(p1)), player2: Array(player2.prefix(p2))).0 {
                    player1.append(contentsOf: [p1, p2])
                } else {
                    player2.append(contentsOf: [p2, p1])
                }
            }
            
            else if p1 > p2 {
                player1.append(contentsOf: [p1, p2])
            }
            
            else if p2 > p1 {
                player2.append(contentsOf: [p2, p1])
            }
        }
        
        let player1Won: Bool
        if player2.count == 0 {
            player1Won = true
        } else {
            player1Won = false
        }
        
        return (player1Won, player1, player2)
    }
}
