import Foundation

public struct Movie {
    public let id: Int
    public let title: String
    public let plot: String
    public let poster: URL?
    public let genre: [Genre]?
    
    public init(id: Int, title: String, plot: String, poster: URL?, genre: [Genre]?) {
        self.id = id
        self.title = title
        self.plot = plot
        self.poster = poster
        self.genre = genre
    }
}

extension Movie: Codable { }
extension Movie: Identifiable { }
extension Movie: Hashable { }
