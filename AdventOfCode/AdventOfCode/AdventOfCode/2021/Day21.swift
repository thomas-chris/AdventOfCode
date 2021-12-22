import Foundation

public struct Day21 {
    
    public static func part1(p1Start: Int, p2Start: Int) -> Int {
        var dice = Array(1...100)
        var player1Board = Array(1...10)
        var player2Board = Array(1...10)
        
        _ = player1Board.rotate(by: p1Start)
        _ = player2Board.rotate(by: p2Start)
        
        var player1Score = 0
        var player2Score = 0
        
        var turns = 0
        var rolls = 0
        
        func roll() -> Int {
            rolls += 3
            return dice.rotate()! + dice.rotate()! + dice.rotate()!
        }
        
        var nooneWon = true
        while nooneWon {
            turns += 1
            let diceroll = roll()
            player1Score += player1Board.rotate(by: diceroll)!
            
            if player1Score >= 1000 { nooneWon = false }
            
            if nooneWon {
                let diceroll = roll()
                player2Score += player2Board.rotate(by: diceroll)!
                
                if player2Score >= 1000 { nooneWon = false }
            }
        }
        
        let loser = min(player1Score, player2Score)
        return loser * rolls
    }
    
    public static func part2(p1Start: Int, p2Start: Int) -> Int {
        
        /*
         if you roll 3 3-sided dies, these are all the possible totals and ways to make them
         3: 1x (1,1,1)
         4: 3x (1,1,2; 1,2,1; 2,1,1)
         5: 6x (1,1,3; 1,2,2; 1,3,1; 2,1,2; 2,2,1; 3,1,1)
         6: 7x (1,2,3; 1,3,2; 2,1,3; 2,2,2; 2,3,1; 3,1,2; 3,2,1)
         7: 6x (1,3,3; 2,2,3; 2,3,2; 3,1,3; 3,2,2; 3,3,1)
         8: 3x (2,3,3; 3,2,3; 3,3,2)
         9: 1x (3,3,3)
         
         so, we only need to iterate through the possible *sums* of the dice (3...9),
         multiplied by the total number of ways we could have rolled that total
         */
        
        struct Game: Hashable {
            var player1Board: [Int]
            var player2Board: [Int]
            
            var player1Score: Int
            var player2Score: Int
        }
        
        var gamesPlayed = [Game: (Int, Int)]()
        
        func playGame(_ game: Game) -> (p1Wins: Int, p2Wins: Int) {
            if game.player1Score >= 21 {
                return (1, 0)
            }
            
            if game.player2Score >= 21 {
                return (0, 1)
            }
            
            if let result = gamesPlayed[game] { return result }
            
            var answer = (0, 0)
            for (rollTotal, times) in [3: 1, 4: 3, 5: 6, 6: 7, 7: 6, 8: 3, 9: 1] {
                // find player 1's new position and score
                var p1Board = game.player1Board
                let score = p1Board.rotate(by: rollTotal)
                let p1NewScore = game.player1Score + (score ?? 0)
                let nextGame = Game(player1Board: game.player2Board, player2Board: p1Board, player1Score: game.player2Score, player2Score: p1NewScore)
                
                // recurse, but swap player 1 and player 2 (because p2 goes next and "becomes" player 1)
                let (p2Wins, p1Wins) = playGame(nextGame)
                answer = (answer.0 + p1Wins * times, answer.1 + p2Wins * times)
            }
            
            gamesPlayed[game] = answer
            return answer
        }
        
        var player1Board = Array(1...10)
        _ = player1Board.rotate(by: p1Start)
        var player2Board = Array(1...10)
        _ = player2Board.rotate(by: p2Start)
        let initialGame = Game(player1Board: player1Board, player2Board: player2Board, player1Score: 0, player2Score: 0)
        
        let result = playGame(initialGame)
    
        return max(result.p1Wins, result.p2Wins)
    }
    
}

extension Array {
    mutating func rotate() -> Element? {
        
        guard let first = self.first else { return nil }
        
        var value = Array(self.dropFirst())
        value.append(first)
        self = value
        return first
    }
    
    mutating func rotate(by index: Int) -> Element? {
        var element: Element? = nil
        for _ in 1...index {
            element = rotate()
        }
        
        return element
    }
}
