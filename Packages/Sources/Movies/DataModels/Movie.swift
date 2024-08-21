import Foundation

struct Movie {
    let id: String
    let title: String
    let plot: String
    let poster: URL?
}

extension Movie: Codable { }
