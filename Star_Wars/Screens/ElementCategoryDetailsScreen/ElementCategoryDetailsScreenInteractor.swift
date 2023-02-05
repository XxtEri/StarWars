//
//  ElementCategoryDetailsScreenInteractor.swift
//  Star_Wars
//
//  Created by Елена on 04.02.2023.
//

import Foundation

protocol IElementCategoryDetailsScreenInteractor {
    func getFilmDetails(elementUrl: String, completion: @escaping (Result<Film, Error>) -> Void)
    func getCharacterDetails(elementUrl: String, completion: @escaping (Result<Character, Error>) -> Void)
    func getPlanetDetails(elementUrl: String, completion: @escaping (Result<Planet, Error>) -> Void)
    func getSpecieDetails(elementUrl: String, completion: @escaping (Result<Specie, Error>) -> Void)
    func getStarshipDetails(elementUrl: String, completion: @escaping (Result<Starship, Error>) -> Void)
    func getVehicleDetails(elementUrl: String, completion: @escaping (Result<Vehicle, Error>) -> Void)
}

final class ElementCategoryDetailsScreenInteractor {
    private let apiRepository: IApiRepository
    
    init(apiRepository: IApiRepository) {
        self.apiRepository = apiRepository
    }
}

extension ElementCategoryDetailsScreenInteractor: IElementCategoryDetailsScreenInteractor {
    func getFilmDetails(elementUrl: String, completion: @escaping (Result<Film, Error>) -> Void) {
        self.apiRepository.loadFilmDetails(elementUrl: elementUrl, completion: completion)
    }
    
    func getCharacterDetails(elementUrl: String, completion: @escaping (Result<Character, Error>) -> Void) {
        self.apiRepository.loadCharacterDetails(elementUrl: elementUrl, completion: completion)
    }
    
    func getPlanetDetails(elementUrl: String, completion: @escaping (Result<Planet, Error>) -> Void) {
        self.apiRepository.loadPlanetDetails(elementUrl: elementUrl, completion: completion)
    }
    
    func getSpecieDetails(elementUrl: String, completion: @escaping (Result<Specie, Error>) -> Void) {
        self.apiRepository.loadSpecieDetails(elementUrl: elementUrl, completion: completion)
    }
    
    func getStarshipDetails(elementUrl: String, completion: @escaping (Result<Starship, Error>) -> Void) {
        self.apiRepository.loadStarshipDetails(elementUrl: elementUrl, completion: completion)
    }
    
    func getVehicleDetails(elementUrl: String, completion: @escaping (Result<Vehicle, Error>) -> Void) {
        self.apiRepository.loadVehicleDetails(elementUrl: elementUrl, completion: completion)
    }

}
