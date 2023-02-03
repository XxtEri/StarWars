//
//  CardInfoScreenPresenter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

final class CardInfoScreenPresenter {
    private let interactor: ICardInfoScreenInteractor
    private let router: ICardInfoScreenRouter
    private weak var viewController: ICardInfoScreenViewController?
    
    private var selectedCategory: Category
    private var isLoading = false
    
    init(interactor: ICardInfoScreenInteractor,
         router: ICardInfoScreenRouter,
         selectedCategory: Category) {
        
        self.interactor = interactor
        self.router = router
        self.selectedCategory = selectedCategory
    }
    
    func setViewController(vc: CardInfoScreenViewController) {
        self.viewController = vc
        
        self.viewController?.setTitle(title: selectedCategory.rawValue.uppercased())
        self.setHandlers()
    }
    
    func loadElementsCard() {
        self.isLoading = true
        
        switch selectedCategory {
        case .characters:
            self.interactor.getCharacters { result in
                switch result {
                case .success(let data):
                    self.successLoadingHandle(with: data.results)
                case .failure(let error):
                    self.failureLoadingHandle(with: error)
                }
            }
        case .films:
            self.interactor.getFilms { result in
                switch result {
                case .success(let data):
                    self.successLoadingHandle(with: data.results)
                case .failure(let error):
                    self.failureLoadingHandle(with: error)
                }
            }
        case .starships:
            print("")
        case .vehicles:
            print("")
        case .planets:
            print("")
        case .species:
            print("")
        }


    }
}

private extension CardInfoScreenPresenter {
    func successLoadingHandle(with elementsCardDTO: [Film]) {
        let elementsCard = elementsCardDTO.map {
            CardInfoScreenModel (elementUrl: $0.url, titleName: $0.name)
        }
        
        self.viewController?.setElementsCardArray(with: elementsCard)
        self.isLoading = false
    }
    
    func successLoadingHandle(with elementsCardDTO: [Character]) {
        let elementsCard = elementsCardDTO.map {
            CardInfoScreenModel (elementUrl: $0.url, titleName: $0.name)
        }
        
        self.viewController?.setElementsCardArray(with: elementsCard)
        self.isLoading = false
    }
    
    func failureLoadingHandle(with error: Error) {
        self.viewController?.showError(error)
        self.isLoading = false
    }
    
    func setHandlers() {
        //отклик
    }
}


//load character -> interasctor

