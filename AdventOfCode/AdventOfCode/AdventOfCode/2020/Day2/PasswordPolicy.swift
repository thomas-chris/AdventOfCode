public struct PasswordPolicy {
    public let min: Int
    public let max: Int
    public let character: Character
}

public struct Password: Hashable {
    public let password: String
    public let uuid: UUID
}
