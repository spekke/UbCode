import Foundation
import Movies

@MainActor
final class AppViewModel: ObservableObject {
    
    let moviesViewModel = MoviesViewModel()
    
}
