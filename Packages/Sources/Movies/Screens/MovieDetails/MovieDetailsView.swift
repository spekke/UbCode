import SwiftUI
import DataModels

struct MovieDetailsView: View {

    @ObservedObject var viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text(viewModel.movie.plot)
        }
        .navigationTitle(viewModel.movie.title)
    }
}

#Preview {
    NavigationStack {
        MovieDetailsView(
            viewModel:
                MovieDetailsViewModel(
                    movie: Movie(id: "1", title: "Movie 1", plot: "Plot 1", poster: nil, genres: [])
                )
        )
    }
}
