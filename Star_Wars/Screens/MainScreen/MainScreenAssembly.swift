//
//  MainScreenAssembly.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

enum MainScreenAssembly {
    struct Parameters {
        let completionHandler: ((Category) -> Void)
    }
    
    static func build(with parameters: Parameters) -> UIViewController {
        let router = MainScreenRouter(completionHandler: parameters.completionHandler)
        
        let presenter = MainScreenPresenter(router: router)
        let viewContoller = MainScreenViewController(presenter: presenter)
        
        presenter.setViewController(vc: viewContoller)
        
        return viewContoller
        
    }
}
