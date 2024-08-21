import Foundation

public extension ApiClient {
    static func live() -> Self {
        Self.init(
            fetchMovies: {
                return []
            }
        )
    }
}
