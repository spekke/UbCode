import Clients
import Dependencies
import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    let appViewModel: AppViewModel = {
        return withDependencies {
            $0.apiClient = .live()
        } operation: {
            AppViewModel()
        }
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
}

