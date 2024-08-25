import Clients
import Dependencies
import Foundation
import UIKit
import DataModels

class AppDelegate: NSObject, UIApplicationDelegate {
    
    let appViewModel: AppViewModel = {
        return withDependencies {
            $0.apiClient = .live()
            $0.cacheClient = .live()
//            $0.cacheClient = .inMemory(movies: [
//                Movie(id: 1, title: "Movie 1", plot: "Plot 1", poster: nil, genre: []),
//            ])
        } operation: {
            AppViewModel()
        }
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}

