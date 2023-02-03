//
//  MainRouter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

protocol IMainRouter {
    func start() -> UINavigationController
}

final class MainRouter {
    private let screenFactory: IScreensFactory
    private var navigationController: UINavigationController?
    
    init (screenFactory: IScreensFactory) {
        self.screenFactory = screenFactory
    }
}

extension MainRouter: IMainRouter {
    func start() -> UINavigationController {
        let startViewController = self.screenFactory.makeFirstScreen()

        let navigationController = UINavigationController(rootViewController: startViewController)

        self.navigationController = navigationController

        return navigationController

    }
}

private extension MainRouter {
    func showListCard(with cardId: String) {
        //let parameters = listCardSreen.Parameters(cardId)
    }
}
