import Foundation
import DataModels

public extension ApiClient {
    static func live() -> Self {
        Self.init(
            fetchMovies: {
                let url = URL(string: "https://freetestapi.com/api/v1/movies")!
                let (data, response) = try await URLSession.shared.data(from: url)
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                return movies
            }
        )
    }
}
