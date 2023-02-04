//
//  ApiRepository.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

import Foundation
import Alamofire

protocol IApiRepository {
    func loadFilmsList(completion: @escaping (Result<InfoFilms, Error>) -> Void)
    func loadCharacterList(completion: @escaping (Result<InfoCharacters, Error>) -> Void)
    func loadStarshipsList(completion: @escaping (Result<InfoStarships, Error>) -> Void)
    func loadVehiclesList(completion: @escaping (Result<InfoVehicles, Error>) -> Void)
    func loadPlanetsList(completion: @escaping (Result<InfoPlanets, Error>) -> Void)
    func loadSpeciesList(completion: @escaping (Result<InfoSpecies, Error>) -> Void) 
}

final class ApiRepository {
    private let baseURL = "https://swapi.dev/api/"
    
    private let session: Alamofire.Session
    
    init() {
        self.session = .default
    }
}

//MARK: -load list of category
extension ApiRepository: IApiRepository {
    //load films
    func loadFilmsList(completion: @escaping (Result<InfoFilms, Error>) -> Void) {
        self.session.request(self.baseURL + "films",
                             method: .get,
                             parameters: nil).responseDecodable(of: InfoFilms.self) { response in
            if let request = response.request {
                print("Request: \(request)")
            }
            
            if let statusCode = response.response?.statusCode {
                print("Status code: \(statusCode)")
                guard statusCode != 400 else {
                    return
                }
                
                guard statusCode != 404 else {
                    return
                }
            }
            
            guard let films = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(films))
        }
    }
    
    //load characters
    func loadCharacterList(completion: @escaping (Result<InfoCharacters, Error>) -> Void) {
        self.session.request(self.baseURL + "people",
                             method: .get,
                             parameters: nil).responseDecodable(of: InfoCharacters.self) { response in
            if let request = response.request {
                
                print("Request: \(request)")
            }
            
            if let statusCode = response.response?.statusCode {
                print("Status code: \(statusCode)")
                guard statusCode != 400 else {
                    return
                }
                
                guard statusCode != 404 else {
                    return
                }
            }
            
            guard let characters = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(characters))
        }
    }
    
    //load starchips
    func loadStarshipsList(completion: @escaping (Result<InfoStarships, Error>) -> Void) {
        self.session.request(self.baseURL + "starships",
                             method: .get,
                             parameters: nil).responseDecodable(of: InfoStarships.self) { response in
            if let request = response.request {
                
                print("Request: \(request)")
            }
            
            if let statusCode = response.response?.statusCode {
                print("Status code: \(statusCode)")
                guard statusCode != 400 else {
                    return
                }
                
                guard statusCode != 404 else {
                    return
                }
            }
            
            guard let characters = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(characters))
        }
    }
    
    //load vehicles
    func loadVehiclesList(completion: @escaping (Result<InfoVehicles, Error>) -> Void) {
        self.session.request(self.baseURL + "vehicles",
                             method: .get,
                             parameters: nil).responseDecodable(of: InfoVehicles.self) { response in
            if let request = response.request {
                
                print("Request: \(request)")
            }
            
            if let statusCode = response.response?.statusCode {
                print("Status code: \(statusCode)")
                guard statusCode != 400 else {
                    return
                }
                
                guard statusCode != 404 else {
                    return
                }
            }
            
            guard let characters = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(characters))
        }
    }
    
    //load planets
    func loadPlanetsList(completion: @escaping (Result<InfoPlanets, Error>) -> Void) {
        self.session.request(self.baseURL + "planets",
                             method: .get,
                             parameters: nil).responseDecodable(of: InfoPlanets.self) { response in
            if let request = response.request {
                
                print("Request: \(request)")
            }
            
            if let statusCode = response.response?.statusCode {
                print("Status code: \(statusCode)")
                guard statusCode != 400 else {
                    return
                }
                
                guard statusCode != 404 else {
                    return
                }
            }
            
            guard let characters = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(characters))
        }
    }
    
    //load species
    func loadSpeciesList(completion: @escaping (Result<InfoSpecies, Error>) -> Void) {
        self.session.request(self.baseURL + "species",
                             method: .get,
                             parameters: nil).responseDecodable(of: InfoSpecies.self) { response in
            if let request = response.request {
                
                print("Request: \(request)")
            }
            
            if let statusCode = response.response?.statusCode {
                print("Status code: \(statusCode)")
                guard statusCode != 400 else {
                    return
                }
                
                guard statusCode != 404 else {
                    return
                }
            }
            
            guard let characters = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(characters))
        }
    }
}
