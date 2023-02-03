//
//  FirstScreenRouter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

protocol IFirstScreenRouter {
    func goToMainScreen()
}

final class FirstScreenRouter {
    private var completionHandler: (() -> Void)?
    
    init (completionHandler: (() -> Void)?) {
        self.completionHandler = completionHandler
    }
}

extension FirstScreenRouter: IFirstScreenRouter {
    func goToMainScreen() {
        self.completionHandler
    }
}
