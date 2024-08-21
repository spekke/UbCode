import Clients
import DataModels
import Dependencies
import Foundation

@MainActor
public final class MoviesViewModel: ObservableObject {
    
    @Dependency(\.apiClient) var apiClient
    
    @Published
    var movies: [Movie] = []
    
    public init() {
        
    }
    
    func fetchData() async {
        print(#function)
        do {
            let movies = try await apiClient.fetchMovies()
            self.movies = movies
        }
        catch {
            print("error", error)
        }
    }
    
    func movieDetailsViewModel(movie: Movie) -> MovieDetailsViewModel {
        return withDependencies(from: self) {
            MovieDetailsViewModel(movie: movie)
        }
    }
}
