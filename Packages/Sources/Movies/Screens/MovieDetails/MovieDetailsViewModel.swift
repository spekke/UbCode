import Foundation
import DataModels

@MainActor
final class MovieDetailsViewModel: ObservableObject {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
