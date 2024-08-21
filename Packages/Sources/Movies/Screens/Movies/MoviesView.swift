import SwiftUI

public struct MoviesView: View {

    @StateObject var viewModel = MoviesViewModel()

    public init() { }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MoviesView()
}
