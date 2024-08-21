import SwiftUI

struct MoviesListView: View {

    @StateObject var viewModel = MoviesListViewModel()

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MoviesListView()
}
