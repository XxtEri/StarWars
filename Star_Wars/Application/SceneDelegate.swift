//
//  SceneDelegate.swift
//  Star_Wars
//
//  Created by Елена on 29.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var navController = UINavigationController()
    private var mainRouter: IMainRouter?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let apiRepository = ApiRepository()
        let screensFactory = ScreensFactory(apiRepository: apiRepository)
        self.mainRouter = MainRouter(screenFactory: screensFactory)
        
        let navigationController = self.mainRouter?.start()
        
        window.rootViewController = navigationController
        
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

