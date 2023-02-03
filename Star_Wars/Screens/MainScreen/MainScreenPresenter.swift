//
//  MainScreenPresenter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

final class MainScreenPresenter {
    //private let interactor:
    private let router: IMainScreenRouter
    private weak var viewController: MainScreenViewController?
    
    init(router: IMainScreenRouter) {
        self.router = router
        
        self.setHandlers()
    }
    
    func setViewController(vc: MainScreenViewController) {
        self.viewController = vc
    }
}

private extension MainScreenPresenter {
    func setHandlers() {
        self.viewController?.didSelectCardHandler = { [weak self] cardTitle in
            self?.router.goToCardDetails(with: cardTitle)
        }
    }
}
