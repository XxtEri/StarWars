//
//  ElementCategoryDetailsScreenPresenter.swift
//  Star_Wars
//
//  Created by Елена on 04.02.2023.
//

import Foundation

final class ElementCategoryDetailsScreenPresenter {
    private let interactor: IElementCategoryDetailsScreenInteractor
    private weak var viewController: ElementCategoryDetailsScreenViewController?
    
    private var selectedCategory: Category
    
    init(interactor: IElementCategoryDetailsScreenInteractor,
         selectedCategory: Category) {
        self.interactor = interactor
        self.selectedCategory = selectedCategory
    }
    
    func setViewController(vc: ElementCategoryDetailsScreenViewController) {
        self.viewController = vc
    }
    
    func loadElementDetails() {
        switch selectedCategory {
        case .characters:
            loadCharacter()
        case .films:
            loadFilm()
        case .starships:
            loadStarship()
        case .vehicles:
            loadVehicle()
        case .planets:
            loadPlanet()
        case .species:
            loadSpecie()
        }
    }
}

//MARK: - Method load film details
private extension ElementCategoryDetailsScreenPresenter {
    func loadFilm() {
        guard let url = self.viewController?.elementUrl else { return }
        
        self.interactor.getFilmDetails(elementUrl: url) { result in
            switch result {
            case .success(let elementCategoryDetails):
                self.successLoadingHandle(with: elementCategoryDetails)
            case .failure(let error):
                self.failureLoadingHandle(with: error)
            }
        }
    }
    
    func successLoadingHandle(with planetDetails: Film) {
        var element = ElementCategoryDetailsScreenModel(titleElement: "", infoElement: "")
        element.titleElement = planetDetails.name + " \(planetDetails.episodeId)"
        element.infoElement = "Opening crawl: " + planetDetails.openingCrawl + "\n\n"
        element.infoElement += "Director: " + planetDetails.director + "\n\n"
        element.infoElement += "Producer: " + planetDetails.producer + "\n\n"
        element.infoElement += "Release date: " + planetDetails.releaseDate + "\n\n"
        
        self.viewController?.addNewElementDetails(with: element)
    }
    
}

//MARK: - Method load character details
private extension ElementCategoryDetailsScreenPresenter {
    func loadCharacter() {
        guard let url = self.viewController?.elementUrl else { return }
        
        self.interactor.getCharacterDetails(elementUrl: url) { result in
            switch result {
            case .success(let elementCategoryDetails):
                self.successLoadingHandle(with: elementCategoryDetails)
            case .failure(let error):
                self.failureLoadingHandle(with: error)
            }
        }
    }
    
    func successLoadingHandle(with planetDetails: Character) {
        var element = ElementCategoryDetailsScreenModel(titleElement: "", infoElement: "")
        element.titleElement = planetDetails.name
        element.infoElement = "Height: " + planetDetails.height + "\n\n"
        element.infoElement += "Mass: " + planetDetails.mass + "\n\n"
        element.infoElement += "Hair color: " + planetDetails.hairColor + "\n\n"
        element.infoElement += "Skin color: " + planetDetails.skinColor + "\n\n"
        element.infoElement += "Eye color: " + planetDetails.eyeColor + "\n\n"
        element.infoElement += "Birth year: " + planetDetails.birthYear + "\n\n"
        element.infoElement += "Gender: " + planetDetails.gender + "\n\n"
        
        self.viewController?.addNewElementDetails(with: element)
    }
}

//MARK: - Method load starship details
private extension ElementCategoryDetailsScreenPresenter {
    func loadStarship() {
        guard let url = self.viewController?.elementUrl else { return }
        
        self.interactor.getStarshipDetails(elementUrl: url) { result in
            switch result {
            case .success(let elementCategoryDetails):
                self.successLoadingHandle(with: elementCategoryDetails)
            case .failure(let error):
                self.failureLoadingHandle(with: error)
            }
        }
    }
    
    func successLoadingHandle(with planetDetails: Starship) {
        var element = ElementCategoryDetailsScreenModel(titleElement: "", infoElement: "")
        element.titleElement = planetDetails.name
        element.infoElement = "Model: " + planetDetails.model + "\n\n"
        element.infoElement += "Manufacturer: " + planetDetails.manufacturer + "\n\n"
        element.infoElement += "Cost in credits: " + planetDetails.costInCredits + "\n\n"
        element.infoElement += "Length: " + planetDetails.length + "\n\n"
        element.infoElement += "Max atmosphering speed: " + planetDetails.maxAtmospheringSpeed + "\n\n"
        element.infoElement += "Crew: " + planetDetails.crew + "\n\n"
        element.infoElement += "Passengers: " + planetDetails.passengers + "\n\n"
        element.infoElement += "Cargo capacity: " + planetDetails.cargoCapacity + "\n\n"
        element.infoElement += "Consumables: " + planetDetails.consumables + "\n\n"
        element.infoElement += "Hyperdrive rating: " + planetDetails.hyperdriveRating + "\n\n"
        element.infoElement += "MGLT: " + planetDetails.MGLT + "\n\n"
        element.infoElement += "Starship class: " + planetDetails.starshipClass + "\n\n"
        
        self.viewController?.addNewElementDetails(with: element)
    }
}

//MARK: - Method load vehicle details
private extension ElementCategoryDetailsScreenPresenter {
    func loadVehicle() {
        guard let url = self.viewController?.elementUrl else { return }
        
        self.interactor.getVehicleDetails(elementUrl: url) { result in
            switch result {
            case .success(let elementCategoryDetails):
                self.successLoadingHandle(with: elementCategoryDetails)
            case .failure(let error):
                self.failureLoadingHandle(with: error)
            }
        }
    }
    
    func successLoadingHandle(with planetDetails: Vehicle) {
        var element = ElementCategoryDetailsScreenModel(titleElement: "", infoElement: "")
        element.titleElement = planetDetails.name
        element.infoElement = "Model: " + planetDetails.model + "\n\n"
        element.infoElement += "Manufacturer: " + planetDetails.manufacturer + "\n\n"
        element.infoElement += "Cost in credits: " + planetDetails.costInCredits + "\n\n"
        element.infoElement += "Length: " + planetDetails.length + "\n\n"
        element.infoElement += "Max atmosphering speed: " + planetDetails.maxAtmospheringSpeed + "\n\n"
        element.infoElement += "Crew: " + planetDetails.crew + "\n\n"
        element.infoElement += "Passengers: " + planetDetails.passengers + "\n\n"
        element.infoElement += "Cargo capacity: " + planetDetails.cargoCapacity + "\n\n"
        element.infoElement += "Consumables: " + planetDetails.consumables + "\n\n"
        element.infoElement += "Vehicle class: " + planetDetails.vehicleClass + "\n\n"
        
        self.viewController?.addNewElementDetails(with: element)
    }
}

//MARK: - Method load planet details
private extension ElementCategoryDetailsScreenPresenter {
    func loadPlanet() {
        guard let url = self.viewController?.elementUrl else { return }
        
        self.interactor.getPlanetDetails(elementUrl: url) { result in
            switch result {
            case .success(let elementCategoryDetails):
                self.successLoadingHandle(with: elementCategoryDetails)
            case .failure(let error):
                self.failureLoadingHandle(with: error)
            }
        }
    }
    
    func successLoadingHandle(with planetDetails: Planet) {
        var element = ElementCategoryDetailsScreenModel(titleElement: "", infoElement: "")
        element.titleElement = planetDetails.name
        element.infoElement = "Population: " + planetDetails.population + "\n\n"
        element.infoElement += "RotationPeriod: " + planetDetails.rotationPeriod + "\n\n"
        element.infoElement += "OrbitalPeriod: " + planetDetails.orbitalPeriod + "\n\n"
        element.infoElement += "Diameter: " + planetDetails.diameter + "\n\n"
        element.infoElement += "Gravity: " + planetDetails.gravity + "\n\n"
        element.infoElement += "Terrain: " + planetDetails.terrain + "\n\n"
        element.infoElement += "SurfaceWater: " + planetDetails.surfaceWater + "\n\n"
        element.infoElement += "Climate: " + planetDetails.climate + "\n\n"
        
        self.viewController?.addNewElementDetails(with: element)
    }
}

//MARK: - Method load specie details
private extension ElementCategoryDetailsScreenPresenter {
    func loadSpecie() {
        guard let url = self.viewController?.elementUrl else { return }
        
        self.interactor.getSpecieDetails(elementUrl: url) { result in
            switch result {
            case .success(let elementCategoryDetails):
                self.successLoadingHandle(with: elementCategoryDetails)
            case .failure(let error):
                self.failureLoadingHandle(with: error)
            }
        }
    }
    
    func successLoadingHandle(with planetDetails: Specie) {
        var element = ElementCategoryDetailsScreenModel(titleElement: "", infoElement: "")
        element.titleElement = planetDetails.name
        element.infoElement = "Classification: " + planetDetails.classification + "\n\n"
        element.infoElement += "Designation: " + planetDetails.designation + "\n\n"
        element.infoElement += "Average height: " + planetDetails.averageHeight + "\n\n"
        element.infoElement += "Skincolors: " + planetDetails.skinColors + "\n\n"
        element.infoElement += "Haircolors: " + planetDetails.hairColors + "\n\n"
        element.infoElement += "Eye colors: " + planetDetails.eyeColors + "\n\n"
        element.infoElement += "Average lifespan: " + planetDetails.averageLifespan + "\n\n"
        element.infoElement += "Language: " + planetDetails.language + "\n\n"
        
        self.viewController?.addNewElementDetails(with: element)
    }
}

private extension ElementCategoryDetailsScreenPresenter {
    func failureLoadingHandle(with error: Error) {
        self.viewController?.showError(error)
    }
}
