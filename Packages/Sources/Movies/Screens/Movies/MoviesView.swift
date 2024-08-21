import SwiftUI


public struct MoviesView: View {

    @ObservedObject var viewModel: MoviesViewModel

    public init(viewModel: MoviesViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List(viewModel.movies) { movie in
            NavigationLink(value: movie) {
                Text("\(movie.title)")
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchData()
            }
        }
        .navigationTitle("Movies")
        .navigationDestination(for: Movie.self) { movie in
            let viewModel = viewModel.movieDetailsViewModel(movie: movie)
            MovieDetailsView(viewModel: viewModel)
        }
    }
}

#if DEBUG
import Dependencies
import DataModels

#Preview("Data") {
    NavigationStack {
        MoviesView(
            viewModel: withDependencies {
                $0.apiClient.fetchMovies = {
                    return [
                        Movie(id: "1", title: "Movie 1", plot: "Plot 1", poster: nil, genres: []),
                        Movie(id: "2", title: "Movie 2", plot: "Plot 2", poster: nil, genres: []),
                        Movie(id: "3", title: "Movie 3", plot: "Plot 3", poster: nil, genres: []),
                        Movie(id: "4", title: "Movie 4", plot: "Plot 4", poster: nil, genres: [])
                    ]
                }
            } operation: {
                MoviesViewModel()
            }
        )
    }
}

#Preview("Error") {
    NavigationStack {
        MoviesView(
            viewModel: withDependencies {
                $0.apiClient.fetchMovies = {
                    throw NSError(domain: "errordomain", code: -1)
                }
            } operation: {
                MoviesViewModel()
            }
        )
    }
}

#endif
