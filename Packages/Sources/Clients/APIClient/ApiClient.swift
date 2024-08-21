
import Foundation
import DataModels

public struct ApiClient {
    public var fetchMovies: () async throws -> [Movie]
}
