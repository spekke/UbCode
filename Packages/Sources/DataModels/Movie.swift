import Foundation

public struct Movie {
    public let id: String
    public let title: String
    public let plot: String
    public let poster: URL?
}

extension Movie: Codable { }
