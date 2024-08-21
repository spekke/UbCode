import Foundation
import DataModels
import Dependencies
import DependenciesMacros

@DependencyClient
public struct ApiClient {
    public var fetchMovies: () async throws -> [Movie]
}

extension ApiClient: TestDependencyKey {
    public static let testValue = Self()
}

public extension DependencyValues {
  var apiClient: ApiClient {
    get { self[ApiClient.self] }
    set { self[ApiClient.self] = newValue }
  }
}
