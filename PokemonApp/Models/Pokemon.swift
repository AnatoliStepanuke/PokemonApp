import UIKit

// MARK: - Pokemon
struct Result: Codable {
    let nextPage: String
    let results: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case nextPage = "next"
        case results
    }
}

// MARK: - Result
struct Pokemon: Codable {
    let name: String
}
