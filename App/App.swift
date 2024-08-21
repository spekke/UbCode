import SwiftUI
import Movies

@main
struct UbCodeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MoviesView()
        }
    }
}
