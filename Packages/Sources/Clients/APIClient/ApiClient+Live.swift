import Foundation
import DataModels

public extension ApiClient {
    static func live() -> Self {
        Self.init(
            fetchMovies: {
                try await Task.sleep(nanoseconds: 2 * NSEC_PER_SEC)
                let url = URL(string: "https://freetestapi.com/api/v1/movies")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                return movies
            }
        )
    }
}
