import Algorithms

public struct Day1_2020 {
	public static func getAnswerPart1() -> Double? {
		let input = Input.array(seperator: "\n", file: "Day1_2020")
		
		let combinations = input.combinations(ofCount: 2)
		
		let pairThatSumsTo2020 = combinations.first(where: { $0.reduce(0, +) == 2020 })
		
		return (pairThatSumsTo2020?[0] ?? 0) * (pairThatSumsTo2020?[1] ?? 0)
	}
	
	public static func getAnswerPart2() -> Double? {
		let input = Input.array(seperator: "\n", file: "Day1_2020")
		
		let combinations = input.combinations(ofCount: 3)
		
		let values = combinations.first(where: { $0.reduce(0, +) == 2020 })
		
		return values?.reduce(1, *)
	}
}
