import ConcurrencyExtras
import DataModels
import Foundation

public extension CacheClient {
    static func live() -> Self {
        
        let storage = PeristentMovieStorage()
        
        return self.init(
            cachedMovies: {
                do {
                    return try await storage.getMovies()
                }
                catch {
                    print(#fileID, "error", error)
                    return nil
                }
            },
            storeMovies: { movies in
                do {
                    try await storage.store(movies: movies)
                }
                catch {
                    print(#fileID, "error", error)
                }
            }
        )
    }
}

actor PeristentMovieStorage {
    
    let jsonEncoder = JSONEncoder()
    let jsonDecoder = JSONDecoder()
    let userDefaults = UserDefaults.standard
    
    func getMovies() throws -> [Movie]? {
        guard let data = userDefaults.data(forKey: "movies") else { return nil }
        return try jsonDecoder.decode([Movie].self, from: data)
    }
    
    func store(movies: [Movie]) throws {
        let data = try jsonEncoder.encode(movies)
        userDefaults.set(data, forKey: "movies")
    }
}
