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
        let completionHandler: () -> Void = { [weak self] in
            self?.showMainScreen()
        }
        
        let parameters = FirstScreenAssembly.Parameters(completionHandler: completionHandler)
        let startViewController = self.screenFactory.makeFirstScreen(with: parameters)

        let navigationController = UINavigationController(rootViewController: startViewController)

        self.navigationController = navigationController

        return navigationController

    }
}

private extension MainRouter {
    func showMainScreen() {
        let completionHandler: (Category) -> Void = { [weak self] selectedCategory in
            print(selectedCategory.rawValue)
            self?.showCardInfoScreen(selectedCategory: selectedCategory)
        }
        
        let parameters = MainScreenAssembly.Parameters(completionHandler: completionHandler)
        let viewController = self.screenFactory.makeMainScreen(with: parameters)
        viewController.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showCardInfoScreen(selectedCategory: Category) {
        let completionHandler: (String) -> Void = { [weak self] elementUrl in
            print(selectedCategory.rawValue)
            print(elementUrl)
            self?.showElementCategoryDetailsScreen(selectedCategory: selectedCategory, elementUrl: elementUrl)
        }
        
        let parameters = CardInfoScreenAssembly.Parameters(completionHandler: completionHandler,
                                                           selectedCategory: selectedCategory)
        let viewController = self.screenFactory.makeCardInfoScreen(with: parameters)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showElementCategoryDetailsScreen(selectedCategory: Category, elementUrl: String) {
        let parameters = ElementCategoryDetailsScreenAssembly.Parameters(selectedCategory: selectedCategory, elementUrl: elementUrl)
        let viewController = self.screenFactory.makeElementCategoryDetailsScreen(with: parameters)
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
