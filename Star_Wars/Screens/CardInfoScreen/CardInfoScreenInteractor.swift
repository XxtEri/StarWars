//
//  CardInfoScreenInteractor.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

protocol ICardInfoScreenInteractor {
    func getFilms(completion: @escaping (Result<InfoFilms, Error>) -> Void)
    func getCharacters(completion: @escaping (Result<InfoCharacters, Error>) -> Void)
    func getStarships(completion: @escaping (Result<InfoStarships, Error>) -> Void)
    func getVehicles(completion: @escaping (Result<InfoVehicles, Error>) -> Void)
    func getPlanets(completion: @escaping (Result<InfoPlanets, Error>) -> Void)
    func getSpecies(completion: @escaping (Result<InfoSpecies, Error>) -> Void)
}

final class CardInfoScreenInteractor {
    private let apiRepository: IApiRepository
    
    private var page = 1
    
    init(apiRepository: IApiRepository) {
        self.apiRepository = apiRepository
    }
}

extension CardInfoScreenInteractor: ICardInfoScreenInteractor {
    func getCharacters(completion: @escaping (Result<InfoCharacters, Error>) -> Void) {
        let query = CardInfoScreenQuery(page: self.page)
        self.page += 1
        
        self.apiRepository.loadCharacterList(query: query, completion: completion)
    }
    
    func getFilms(completion: @escaping (Result<InfoFilms, Error>) -> Void) {
        let query = CardInfoScreenQuery(page: self.page)
        self.page += 1
        
        self.apiRepository.loadFilmsList(query: query, completion: completion)
    }
    
    func getStarships(completion: @escaping (Result<InfoStarships, Error>) -> Void) {
        let query = CardInfoScreenQuery(page: self.page)
        self.page += 1
        
        self.apiRepository.loadStarshipsList(query: query, completion: completion)
    }
    
    func getVehicles(completion: @escaping (Result<InfoVehicles, Error>) -> Void) {
        let query = CardInfoScreenQuery(page: self.page)
        self.page += 1
        
        self.apiRepository.loadVehiclesList(query: query, completion: completion)
    }
    
    func getPlanets(completion: @escaping (Result<InfoPlanets, Error>) -> Void) {
        let query = CardInfoScreenQuery(page: self.page)
        self.page += 1
        
        self.apiRepository.loadPlanetsList(query: query, completion: completion)
    }
    
    func getSpecies(completion: @escaping (Result<InfoSpecies, Error>) -> Void) {
        let query = CardInfoScreenQuery(page: self.page)
        self.page += 1
        
        self.apiRepository.loadSpeciesList(query: query, completion: completion)
    }
}
