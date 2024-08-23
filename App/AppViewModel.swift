import Foundation
import MoviesFeature

@MainActor
final class AppViewModel: ObservableObject {
    
    let moviesViewModel = MoviesViewModel()
    
}
