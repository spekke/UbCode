import Foundation

public struct Movie {
    public let id: String
    public let title: String
    public let plot: String
    public let poster: URL?
    public let genres: [Genre]
    
    public init(id: String, title: String, plot: String, poster: URL?, genres: [Genre]) {
        self.id = id
        self.title = title
        self.plot = plot
        self.poster = poster
        self.genres = genres
    }
}

extension Movie: Codable { }
extension Movie: Identifiable { }
extension Movie: Hashable { }
