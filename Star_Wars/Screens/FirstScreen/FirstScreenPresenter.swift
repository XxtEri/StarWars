//
//  FirstScreenPresenter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

final class FirstScreenPresenter {
    private var router: IFirstScreenRouter
    private weak var viewController: FirstScreenViewController?
    
    init (router: IFirstScreenRouter) {
        self.router = router
    }
    
    func setViewController(vc: FirstScreenViewController) {
        self.viewController = vc
        
        
    }
}

extension FirstScreenPresenter {
    func setHandlers() {
        self.viewController?.didSelectNextScreenHandler = self.router.goToMainScreen
    }
}
