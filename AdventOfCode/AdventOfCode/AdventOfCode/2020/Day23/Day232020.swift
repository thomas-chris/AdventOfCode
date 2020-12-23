import Algorithms

extension TwentyTwenty {
    public class Day23 {
        public init() {
        }
    }
}

extension TwentyTwenty.Day23 {
    public func solvePart1(input: String, moves: Int = 100) -> String {
        
        var list = input.compactMap { Int(String($0)) }
        for _ in 0 ..< moves {
            let a = list.remove(at: 1)
            let b = list.remove(at: 1)
            let c = list.remove(at: 1)
            
            var search = list.first! - 1
            var indexOfFound = 0
            
            var contToSearch = true
            while contToSearch {
                if let nextCurrent = list.firstIndex(where: {  $0 == search }) {
                    indexOfFound = nextCurrent
                    contToSearch = false
                } else {
                    search -= 1
                    if search < 0 {
                        search = 9
                    }
                }
            }
            
            let head = list.prefix(indexOfFound + 1)
            let tail = list.suffix(list.count - indexOfFound - 1)
            let insert = [a,b,c]
            
            list = head + insert + tail
            
            let firstValue = list.first!
            list.append(firstValue)
            list = Array(list.dropFirst())
        }
        
        while list.first != 1 {
            let firstValue = list.first!
            list.append(firstValue)
            list = Array(list.dropFirst())
        }
        
        return list.dropFirst().map { String($0) }.joined()
    }
    
    public func solvePart2(input: String, moves: Int = 10_000_000) -> Int {
        
        let list = input.compactMap { Int(String($0)) } + Array(10...1_000_000)
        let first = Node(list[0])
        
        var next = first
        var nodes = [first.value: first]
        for int in list.dropFirst() {
            next = next.insert(int)
            nodes[int] = next
        }
        
        // set up so last node refers to first node and visa versa
        
        first.previous = nodes[1_000_000]
        let last = nodes[1_000_000]!
        last.next = first
        nodes[1_000_000] = last
        
        var cup = first
        
        for _ in 0 ..< moves {
            guard let a = cup.remove(),
                  let b = cup.remove(),
                  let c = cup.remove() else {
                fatalError()
            }
            
            var search = cup.value
            
            while [cup.value, a, b, c].contains(search) {
                search -= 1
                if search < 1 { search = 1_000_000 }
            }
            
            var node = nodes[search]
            
            node = node?.insert(a)
            nodes[a] = node
            node = node?.insert(b)
            nodes[b] = node
            node = node?.insert(c)
            nodes[c] = node
        
            guard let nextCup = cup.next else {
                fatalError()
            }
            
            cup = nextCup
        }

        guard let value1 = nodes[1]?.next?.value, let value2 = nodes[1]?.next?.next?.value else { fatalError() }
        return value1 * value2
    }
}

extension TwentyTwenty.Day23 {
    public class Node {
        
        public let value: Int
        public var previous: Node?
        public var next: Node?
        
        public init(_ value: Int) {
            self.value = value
        }
        
        public func insert(_ value: Int) -> Node {
            let nodeToBeAfterInserted = next
            let newNode = Node(value)
            next = newNode
            newNode.previous = self
            
            nodeToBeAfterInserted?.previous = newNode
            newNode.next = nodeToBeAfterInserted
            return newNode
        }
        
        public func remove() -> Int? {
            let value = next?.value
            let newNext = next?.next
            
            next = newNext
            newNext?.previous = self
            return value
        }
    }
}
