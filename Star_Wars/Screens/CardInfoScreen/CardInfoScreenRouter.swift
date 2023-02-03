//
//  CardInfoScreenRouter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

protocol ICardInfoScreenRouter {
    func goToElementCardDetails(with elementId: Int)
}

final class CardInfoScreenRouter {
    private var completionHandler: ((Int) -> Void)?
    
    init(completionHandler: ((Int) -> Void)?) {
        self.completionHandler = completionHandler
    }
}

extension CardInfoScreenRouter: ICardInfoScreenRouter {
    func goToElementCardDetails(with elementId: Int) {
        self.completionHandler?(elementId)
    }
}
