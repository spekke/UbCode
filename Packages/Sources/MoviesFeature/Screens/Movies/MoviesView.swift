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
        .overlay {
            if viewModel.isLoading && viewModel.movies.isEmpty {
                ProgressView()
            }
            else if viewModel.error != nil {
                ContentUnavailableView("Something went wrong", systemImage: "exclamationmark.circle")
            }
        }
        .task {
            await viewModel.fetchData()
        }
        .navigationTitle("Movies")
        .navigationDestination(for: Movie.self) { movie in
            let viewModel = viewModel.movieDetailsViewModel(movie: movie)
            MovieDetailsView(viewModel: viewModel)
        }
    }
}

#if DEBUG
import Clients
import DataModels
import Dependencies

#Preview("Data - No cached") {
    NavigationStack {
        MoviesView(
            viewModel: withDependencies {
                $0.cacheClient = CacheClient.inMemory()
                $0.apiClient.fetchMovies = {
                    try await Task.sleep(nanoseconds: 1 * NSEC_PER_SEC)
                    return [
                        Movie(id: 1, title: "Movie 1", plot: "Plot 1", poster: nil, genre: []),
                        Movie(id: 2, title: "Movie 2", plot: "Plot 2", poster: nil, genre: []),
                        Movie(id: 3, title: "Movie 3", plot: "Plot 3", poster: nil, genre: []),
                        Movie(id: 4, title: "Movie 4", plot: "Plot 4", poster: nil, genre: [])
                    ]
                }
            } operation: {
                MoviesViewModel()
            }
        )
    }
}

#Preview("Data - Cached") {
    NavigationStack {
        MoviesView(
            viewModel: withDependencies {
                $0.cacheClient = CacheClient.inMemory(movies: [
                    Movie(id: 1, title: "Movie 1", plot: "Plot 1", poster: nil, genre: []),
                    Movie(id: 2, title: "Movie 2", plot: "Plot 2", poster: nil, genre: []),
                ])
                $0.apiClient.fetchMovies = {
                    try await Task.sleep(nanoseconds: 1 * NSEC_PER_SEC)
                    return [
                        Movie(id: 1, title: "Movie 1", plot: "Plot 1", poster: nil, genre: []),
                        Movie(id: 2, title: "Movie 2", plot: "Plot 2", poster: nil, genre: []),
                        Movie(id: 3, title: "Movie 3", plot: "Plot 3", poster: nil, genre: []),
                        Movie(id: 4, title: "Movie 4", plot: "Plot 4", poster: nil, genre: [])
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
                    try await Task.sleep(nanoseconds: 1 * NSEC_PER_SEC)
                    throw NSError(domain: "errordomain", code: -1)
                }
            } operation: {
                MoviesViewModel()
            }
        )
    }
}

#endif
