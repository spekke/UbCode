import SwiftUI
import DataModels

struct MovieDetailsView: View {

    @ObservedObject var viewModel: MovieDetailsViewModel
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.movie.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(viewModel.movie.plot)
                Spacer()
                
                if let genres = viewModel.movie.genre, genres.count > 0 {
                    HStack {
                        ForEach(genres) { genre in
                            Text(genre.title)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.accentColor)
                                .clipShape(Capsule(style: .circular))
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MovieDetailsView(
            viewModel:
                MovieDetailsViewModel(
                    movie: Movie(
                        id: 1,
                        title: "Movie 1",
                        plot: "Two imprisoned men bond over several years, finding solace and eventual redemption through acts of common decency.",
                        poster: nil,
                        genre: [.drama, .adventure]
                    )
                )
        )
    }
}
