//
//  FirstScreenAssembly.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

enum FirstScreenAssembly {
    
    struct Parameters {
        let completionHandler: (() -> Void)
    }
    
    static func build(with parameters: Parameters) -> UIViewController {
        let router = FirstScreenRouter(completionHandler: parameters.completionHandler)
        
        let presenter = FirstScreenPresenter(router: router)
        let viewController = FirstScreenViewController(presenter: presenter)
        presenter.setViewController(vc: viewController)

        return viewController
    }
}
