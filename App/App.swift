import Movies
import SwiftUI
import Dependencies

@main
struct UbCodeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var viewModel: AppViewModel { appDelegate.appViewModel }
    
    var body: some Scene {
        WindowGroup {
            MoviesView(viewModel: viewModel.moviesViewModel)
        }
    }
}
