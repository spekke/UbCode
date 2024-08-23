import Foundation
import DataModels
import Dependencies
import DependenciesMacros

@DependencyClient
public struct CacheClient {
    public var cachedMovies: () async -> [Movie]?
    public var storeMovies: (_ movies: [Movie]) async -> Void
}

extension CacheClient: TestDependencyKey {
    public static let testValue = Self()
    public static var previewValue: CacheClient { CacheClient.inMemory() }
}

public extension DependencyValues {
  var cacheClient: CacheClient {
    get { self[CacheClient.self] }
    set { self[CacheClient.self] = newValue }
  }
}

