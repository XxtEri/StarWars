//
//  MainScreenRouter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

protocol IMainScreenRouter {
    func goToCardDetails(with cardTitle: Category)
}

final class MainScreenRouter {
    private var completionHandler: ((Category) -> Void)?
    
    init(completionHandler: ((Category) -> Void)?) {
        self.completionHandler = completionHandler
    }
}

extension MainScreenRouter: IMainScreenRouter {
    func goToCardDetails(with cardTitle: Category) {
        self.completionHandler?(cardTitle)
    }
}
