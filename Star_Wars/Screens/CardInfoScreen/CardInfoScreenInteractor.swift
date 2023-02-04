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
    
    init(apiRepository: IApiRepository) {
        self.apiRepository = apiRepository
    }
}

extension CardInfoScreenInteractor: ICardInfoScreenInteractor {
    func getCharacters(completion: @escaping (Result<InfoCharacters, Error>) -> Void) {
        self.apiRepository.loadCharacterList(completion: completion)
    }
    
    func getFilms(completion: @escaping (Result<InfoFilms, Error>) -> Void) {
        self.apiRepository.loadFilmsList(completion: completion)
    }
    
    func getStarships(completion: @escaping (Result<InfoStarships, Error>) -> Void) {
        self.apiRepository.loadStarshipsList(completion: completion)
    }
    
    func getVehicles(completion: @escaping (Result<InfoVehicles, Error>) -> Void) {
        self.apiRepository.loadVehiclesList(completion: completion)
    }
    
    func getPlanets(completion: @escaping (Result<InfoPlanets, Error>) -> Void) {
        self.apiRepository.loadPlanetsList(completion: completion)
    }
    
    func getSpecies(completion: @escaping (Result<InfoSpecies, Error>) -> Void) {
        self.apiRepository.loadSpeciesList(completion: completion)
    }
}
