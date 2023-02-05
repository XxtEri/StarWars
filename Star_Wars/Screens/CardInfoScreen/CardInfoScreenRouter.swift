//
//  CardInfoScreenRouter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

protocol ICardInfoScreenRouter {
    func goToElementCardDetails(with elementUrl: String)
}

final class CardInfoScreenRouter {
    private var completionHandler: ((String) -> Void)?
    
    init(completionHandler: ((String) -> Void)?) {
        self.completionHandler = completionHandler
    }
}

extension CardInfoScreenRouter: ICardInfoScreenRouter {
    func goToElementCardDetails(with elementUrl: String) {
        self.completionHandler?(elementUrl)
    }
}
