import Algorithms

public struct Day2 {
    
    public enum RockPaperScissor: Int {
        case rock = 1
        case paper = 2
        case scissor = 3
        
        public init?(_ string: String?) {
            switch string {
            case "A", "X":
                self = .rock
            case "B", "Y":
                self = .paper
            case "C", "Z":
                self = .scissor
            default:
                return nil
            }
        }
        
        public init?(instruction: WinLoseDraw?, computer: RockPaperScissor) {
            switch instruction {
            case .win:
                self = Self.win(computer)
            case .draw:
                self = computer
            case .lose:
                self = Self.lose(computer)
            default:
                return nil
            }
        }
        
        static func win(_ against: RockPaperScissor) -> RockPaperScissor {
            switch against {
            case .rock: return .paper
            case .paper: return .scissor
            case .scissor: return .rock
            }
        }
        
        static func lose(_ against: RockPaperScissor) -> RockPaperScissor {
            switch against {
            case .rock: return .scissor
            case .paper: return .rock
            case .scissor: return .paper
            }
        }
    }
    
    public enum WinLoseDraw {
        case win
        case lose
        case draw
        
        public init?(_ string: String?) {
            switch string {
            case "A", "X":
                self = .lose
            case "B", "Y":
                self = .draw
            case "C", "Z":
                self = .win
            default:
                return nil
            }
        }
    }
    
    public static func getAnswerPart1(input: [String]) -> Int {
        
        let game = input
            .compactMap { $0.components(separatedBy: " ").compactMap(Day2.RockPaperScissor.init)
        }
        
        return playerScore(game) + game.map(gameScore).reduce(0,+)
    }
    
    public static func part2(_ input: [String]) -> Int {
        let game = input
            .compactMap { string -> [RockPaperScissor]? in
                let options = string.components(separatedBy: " ")
                guard let computer = RockPaperScissor.init(options.first),
                      let player = RockPaperScissor.init(instruction: WinLoseDraw(options.last), computer: computer)
                else { return nil }
                return [computer, player]
        }
        
        return playerScore(game) + game.map(gameScore).reduce(0,+)
    }
    
    static func gameScore(_ game: [RockPaperScissor]) -> Int {
        switch game {
        case [.rock, .rock], [.paper, .paper], [.scissor, .scissor]:
            return 3
        case [.rock, .paper], [.paper, .scissor], [.scissor, .rock]:
            return 6
        default:
            return 0
        }
    }
    
    static func playerScore(_ games: [[RockPaperScissor]]) -> Int {
        
        games
            .compactMap { $0.last!.rawValue }
            .reduce(0,+)
    }
}
