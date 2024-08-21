import Foundation

public struct Movie {
    public let id: String
    public let title: String
    public let plot: String
    public let poster: URL?
    public let genres: [Genre]
}

extension Movie: Codable { }
