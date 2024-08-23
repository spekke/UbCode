import MoviesFeature
import SwiftUI
import Dependencies

@main
struct UbCodeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var viewModel: AppViewModel { appDelegate.appViewModel }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MoviesView(viewModel: viewModel.moviesViewModel)
            }
        }
    }
}
