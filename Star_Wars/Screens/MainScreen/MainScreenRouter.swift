//
//  MainScreenRouter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

enum TitleCard: String, CaseIterable {
    case characters = "Characters"
    case films = "Films"
    case starships = "Starships"
    case vehicles = "Vehicles"
    case planets = "Planets"
    case species = "Species"
}

protocol IMainScreenRouter {
    func goToCardDetails(with cardTitle: TitleCard)
}

final class MainScreenRouter {
    private var completionHandler: ((TitleCard) -> Void)?
    
    init(completionHandler: ((TitleCard) -> Void)?) {
        self.completionHandler = completionHandler
    }
}

extension MainScreenRouter: IMainScreenRouter {
    func goToCardDetails(with cardTitle: TitleCard) {
        self.completionHandler?(cardTitle)
    }
}
