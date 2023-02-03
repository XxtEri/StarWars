//
//  ScreensFactory.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import UIKit

protocol IScreensFactory {
    func makeFirstScreen() -> UIViewController
    //func makeMainScreen(with parameters: AnimeDetailsAssembly.Parameters) -> UIViewController
}

final class ScreensFactory {
    //private let apiRepository: IApiRepository

//    init(apiRepository: IApiRepository,
//         imageDownloadService: IImageDownloadService) {
//        self.apiRepository = apiRepository
//        self.imageDownloadService = imageDownloadService
//    }
}

extension ScreensFactory: IScreensFactory {
    func makeFirstScreen() -> UIViewController {
        let vc = FirstScreenAssembly.build()

        return vc
    }
    
//    func makeAnimeDetails(with parameters: AnimeDetailsAssembly.Parameters) -> UIViewController {
//        let dependencies = AnimeDetailsAssembly.Dependencies(apiRepository: self.apiRepository,
//                                                             imageDownloadService: self.imageDownloadService)
//
//        let vc = AnimeDetailsAssembly.build(with: parameters, and: dependencies)
//
//        return vc
//    }
}
