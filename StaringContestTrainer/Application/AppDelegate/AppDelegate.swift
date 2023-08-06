//
//  AppDelegate.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var router: AppRoutable?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        router = AppRouter()
        
        AppCore.shared.prepareSession { [weak self] success in
            self?.routeToInitialScene()
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        AppCore.shared.closeSession()
    }
    
    private func routeToInitialScene() {
        self.router?.routeToInitialScene()
    }
}
