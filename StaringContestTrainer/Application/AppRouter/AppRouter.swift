//
//  AppRouter.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import UIKit

protocol AppRoutable {
    func routeToInitialScene()
}

class AppRouter {
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.backgroundColor = .systemBackground
    }
    
    private let window: UIWindow
}

extension AppRouter: AppRoutable {
    func routeToInitialScene() {
//        window.rootViewController = InitialSceneRouter.assembly()
//        window.makeKeyAndVisible()
    }
}
