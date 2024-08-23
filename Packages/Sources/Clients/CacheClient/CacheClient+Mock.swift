import Foundation
import DataModels
import ConcurrencyExtras

extension CacheClient {
    public static func inMemory(movies: [Movie]? = nil) -> CacheClient {
        let storage = LockIsolated<[Movie]?>(movies)
        
        return CacheClient.init(
            cachedMovies: {
                return storage.value
            },
            storeMovies: { movies in
                storage.setValue(movies)
            }
        )
    }
}
