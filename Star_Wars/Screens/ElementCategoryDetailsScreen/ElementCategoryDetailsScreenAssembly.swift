//
//  ElementCategoryDetailsScreenAssembly.swift
//  Star_Wars
//
//  Created by Елена on 04.02.2023.
//

import UIKit

enum ElementCategoryDetailsScreenAssembly {
    struct Dependencies {
        let apirepository: IApiRepository
    }
    
    struct Parameters {
        let selectedCategory: Category
        let elementUrl: String
    }
    
    static func build(with parameters: Parameters, and dependencies: Dependencies) -> UIViewController {
        let interactor = ElementCategoryDetailsScreenInteractor(apiRepository: dependencies.apirepository)
        
        let presenter = ElementCategoryDetailsScreenPresenter(interactor: interactor, selectedCategory: parameters.selectedCategory)
        let viewController = ElementCategoryDetailsScreenViewController(presenter: presenter, elementUrl: parameters.elementUrl)
        presenter.setViewController(vc: viewController)
        
        return viewController
    }
}
