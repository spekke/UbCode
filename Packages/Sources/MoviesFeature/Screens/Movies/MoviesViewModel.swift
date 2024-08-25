import Clients
import DataModels
import Dependencies
import Foundation

@MainActor
public final class MoviesViewModel: ObservableObject {
    
    @Dependency(\.apiClient) var apiClient
    @Dependency(\.cacheClient) var cacheClient
    
    @Published var isLoading = false
    @Published var error: Error?
    @Published var movies: [Movie] = []
    
    public init() { }
    
    func fetchData() async {
        defer {
            self.isLoading = false
        }
        self.error = nil
        self.isLoading = true
        
        do {
            if self.movies.isEmpty, let cachedMovies = await cacheClient.cachedMovies() {
                print(#fileID, #function, "Populating from cache")
                self.movies = cachedMovies
            }
            
            let movies = try await apiClient.fetchMovies()
            self.movies = movies
            await self.cacheClient.storeMovies(movies: movies)
        }
        catch is CancellationError { }
        catch {
            print("error", error)
            self.error = error
        }
    }
    
    func movieDetailsViewModel(movie: Movie) -> MovieDetailsViewModel {
        return withDependencies(from: self) {
            MovieDetailsViewModel(movie: movie)
        }
    }
}
