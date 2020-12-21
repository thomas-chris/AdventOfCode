import Algorithms

extension TwentyTwenty {
    public class Day21 {
        public init() {
        }
    }
}

extension TwentyTwenty.Day21 {
    public func solvePart1(input: [String]) -> Int {
        
        let (ingridientCount, allergensTable) = getIngridientsCountAndAllergens(input: input)
       
        let possibleAllergenicIngredients = allergensTable.values.flatMap({ $0 })
        
        var newIngCount = [String: Int]()
        for ingridient in ingridientCount.keys {
            if !possibleAllergenicIngredients.contains(ingridient) {
                newIngCount[ingridient] = ingridientCount[ingridient]!
            }
        }

        return newIngCount.values.reduce(0, +)
    }
    
    public func solvePart2(input: [String]) -> String {
        
        var (_, allergensTable) = getIngridientsCountAndAllergens(input: input) 
        
        while allergensTable.values.contains(where: { $0.count > 1 }) {
            allergensTable.forEach { (allergen, ingridients) in
                if ingridients.count == 1 {
                    allergensTable.forEach { (key, _) in
                        if key != allergen {
                            allergensTable[key]?.remove(ingridients.first!)
                        }
                    }
                }
            }
        }
        
        return allergensTable.keys
            .sorted()
            .compactMap { allergensTable[$0]?.first }
            .joined(separator: ",")
    }
    
    private func getIngridientsCountAndAllergens(input: [String]) -> ([String: Int], [String: Set<String>]) {
        var ingridientCount = [String: Int]()
        var allergensTable = [String: Set<String>]()
        
        for line in input {
            let splitLine = line.components(separatedBy: "(contains ")
            let ingridients = splitLine[0]
                .components(separatedBy: .whitespaces).filter { $0 != "" }
            let allergens = Set(splitLine[1].replacingOccurrences(of: ")", with: "").components(separatedBy: ", "))
            
            for i in ingridients {
                ingridientCount[i, default: 0] += 1
            }
            
            for allergen in allergens {
                if let existingAllergen = allergensTable[allergen] {
                    allergensTable[allergen] = existingAllergen.intersection(ingridients)
                } else {
                    allergensTable[allergen] = Set(ingridients)
                }
            }
        }
        
        return (ingridientCount, allergensTable)
    }
}
