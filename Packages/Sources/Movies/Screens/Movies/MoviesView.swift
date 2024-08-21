import SwiftUI

public struct MoviesView: View {

    @ObservedObject var viewModel: MoviesViewModel

    public init(viewModel: MoviesViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MoviesView(viewModel: MoviesViewModel())
}
