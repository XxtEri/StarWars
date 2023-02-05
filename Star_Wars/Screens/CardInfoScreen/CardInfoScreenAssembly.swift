//
//  CardInfoScreenAssembly.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

enum CardInfoScreenAssembly {
    struct Dependencies {
        let apiRepository: IApiRepository
    }
    
    struct Parameters {
        let completionHandler: ((String) -> Void)
        let selectedCategory: Category
    }
    
    static func build(with parameters: Parameters, and dependencies: Dependencies) -> UIViewController {
        let router = CardInfoScreenRouter(completionHandler: parameters.completionHandler)
        let interactor = CardInfoScreenInteractor(apiRepository: dependencies.apiRepository)
        
        let presenter = CardInfoScreenPresenter(interactor: interactor,
                                                router: router,
                                                selectedCategory: parameters.selectedCategory)
        let viewController = CardInfoScreenViewController(presenter: presenter)
        presenter.setViewController(vc: viewController)
        
        return viewController
    }
}
