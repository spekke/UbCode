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
    @Published var firstLoad = true
    
    public init() {
        
    }
    
    func fetchData() async {
        defer {
            self.isLoading = false
        }
        self.isLoading = true
        
        do {
            if firstLoad, let cachedMovies = await cacheClient.cachedMovies() {
                self.movies = cachedMovies
                self.firstLoad = false
                await Task.yield()
            }
            
            let movies = try await apiClient.fetchMovies()
            self.movies = movies
            await self.cacheClient.storeMovies(movies: movies)
        }
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
