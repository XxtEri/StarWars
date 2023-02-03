//
//  ScreensFactory.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

protocol IScreensFactory {
    func makeFirstScreen(with parameters: FirstScreenAssembly.Parameters) -> UIViewController
    func makeMainScreen(with parameters: MainScreenAssembly.Parameters) -> UIViewController
    func makeCardInfoScreen(with parameters: CardInfoScreenAssembly.Parameters) -> UIViewController
}

final class ScreensFactory {
    private let apiRepository: IApiRepository

    init(apiRepository: IApiRepository) {
        self.apiRepository = apiRepository
    }
}

extension ScreensFactory: IScreensFactory {
    func makeFirstScreen(with parameters: FirstScreenAssembly.Parameters) -> UIViewController {
        let vc = FirstScreenAssembly.build(with: parameters)

        return vc
    }
    
    func makeMainScreen(with parameters: MainScreenAssembly.Parameters) -> UIViewController {
        let vc = MainScreenAssembly.build(with: parameters)
        
        return vc
    }
    
    func makeCardInfoScreen(with parameters: CardInfoScreenAssembly.Parameters) -> UIViewController {
        let dependencies = CardInfoScreenAssembly.Dependencies(apiRepository: self.apiRepository)
        
        let vc = CardInfoScreenAssembly.build(with: parameters, and: dependencies)
        
        return vc
    }
}
