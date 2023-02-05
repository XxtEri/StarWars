//
//  CardInfoScreenPresenter.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

final class CardInfoScreenPresenter {
    private let interactor: ICardInfoScreenInteractor
    private let router: ICardInfoScreenRouter
    private var viewController: ICardInfoScreenViewController?
    
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
        switch selectedCategory {
        case .characters:
            loadCharacters()
        case .films:
            loadFilms()
        case .starships:
            loadStarships()
        case .vehicles:
            loadVehicles()
        case .planets:
            loadPlanets()
        case .species:
            loadSpecies()
        }
    }
}

//MARK: - Method load list of films
private extension CardInfoScreenPresenter {
    func loadFilms() {
        if !self.isLoading {
            self.isLoading = true
            
            self.interactor.getFilms { result in
                switch result {
                case .success(let data):
                    self.successLoadingHandle(with: data.results)
                case .failure(let error):
                    self.failureLoadingHandle(with: error)
                }
            }
        }
    }
    
    func successLoadingHandle(with elementsCardDTO: [Film]) {
        let elementsCard = elementsCardDTO.map {
            CardInfoScreenModel (elementUrl: $0.url, titleName: $0.name)
        }
        
        self.viewController?.addNewElementsCard(with: elementsCard)
        self.isLoading = false
    }
}

//MARK: - Method load list of characters
private extension CardInfoScreenPresenter {
    func loadCharacters() {
        if !self.isLoading {
            self.isLoading = true
            
            self.interactor.getCharacters { result in
                switch result {
                case .success(let data):
                    self.successLoadingHandle(with: data.results)
                case .failure(let error):
                    self.failureLoadingHandle(with: error)
                }
            }
        }
    }
    
    func successLoadingHandle(with elementsCardDTO: [Character]) {
        let elementsCard = elementsCardDTO.map {
            CardInfoScreenModel (elementUrl: $0.url, titleName: $0.name)
        }
        
        self.viewController?.addNewElementsCard(with: elementsCard)
        self.isLoading = false
    }
}

//MARK: - Method load list of starships
private extension CardInfoScreenPresenter {
    func loadStarships() {
        if !self.isLoading {
            self.isLoading = true
            
            self.interactor.getStarships { result in
                switch result {
                case .success(let data):
                    self.successLoadingHandle(with: data.results)
                case .failure(let error):
                    self.failureLoadingHandle(with: error)
                }
            }
        }
    }
    
    func successLoadingHandle(with elementsCardDTO: [Starship]) {
        let elementsCard = elementsCardDTO.map {
            CardInfoScreenModel (elementUrl: $0.url, titleName: $0.name)
        }
        
        self.viewController?.addNewElementsCard(with: elementsCard)
        self.isLoading = false
    }
}

//MARK: - Method load list of vehicles
private extension CardInfoScreenPresenter {
    func loadVehicles() {
        if !self.isLoading {
            self.isLoading = true
            
            self.interactor.getVehicles { result in
                switch result {
                case .success(let data):
                    self.successLoadingHandle(with: data.results)
                case .failure(let error):
                    self.failureLoadingHandle(with: error)
                }
            }
        }
    }
    
    func successLoadingHandle(with elementsCardDTO: [Vehicle]) {
        let elementsCard = elementsCardDTO.map {
            CardInfoScreenModel (elementUrl: $0.url, titleName: $0.name)
        }
        
        self.viewController?.addNewElementsCard(with: elementsCard)
        self.isLoading = false
    }
}

//MARK: - Method load list of planets
private extension CardInfoScreenPresenter {
    func loadPlanets() {
        if !self.isLoading {
            self.isLoading = true
            
            self.interactor.getPlanets { result in
                switch result {
                case .success(let data):
                    self.successLoadingHandle(with: data.results)
                case .failure(let error):
                    self.failureLoadingHandle(with: error)
                }
            }
        }
    }
    
    func successLoadingHandle(with elementsCardDTO: [Planet]) {
        let elementsCard = elementsCardDTO.map {
            CardInfoScreenModel (elementUrl: $0.url, titleName: $0.name)
        }
        
        self.viewController?.addNewElementsCard(with: elementsCard)
        self.isLoading = false
    }
}

//MARK: - Method load list of species
private extension CardInfoScreenPresenter {
    func loadSpecies() {
        if !self.isLoading {
            self.isLoading = true
            self.interactor.getSpecies { result in
                switch result {
                case .success(let data):
                    self.successLoadingHandle(with: data.results)
                case .failure(let error):
                    self.failureLoadingHandle(with: error)
                }
            }
        }
    }
    
    func successLoadingHandle(with elementsCardDTO: [Specie]) {
        let elementsCard = elementsCardDTO.map {
            CardInfoScreenModel (elementUrl: $0.url, titleName: $0.name)
        }
        
        self.viewController?.addNewElementsCard(with: elementsCard)
        self.isLoading = false
    }
}

private extension CardInfoScreenPresenter {
    func failureLoadingHandle(with error: Error) {
        self.viewController?.showError(error)
        self.isLoading = false
    }
    
    func setHandlers() {
        self.viewController?.didSelectElementCategory = {[weak self] elementUrl in
            self?.router.goToElementCardDetails(with: elementUrl)
        }
    }
}
