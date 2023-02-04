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
    func load(completion: @escaping (Result<InfoSpecies, Error>) -> Void)
    
    func loadFilmDetails(elementUrl: String, completion: @escaping (Result<Film, Error>) -> Void)
    func loadCharacterDetails(elementUrl: String, completion: @escaping (Result<Character, Error>) -> Void)
    func loadStarshipDetails(elementUrl: String, completion: @escaping (Result<Starship, Error>) -> Void)
    func loadVehicleDetails(elementUrl: String, completion: @escaping (Result<Vehicle, Error>) -> Void)
    func loadPlanetDetails(elementUrl: String, completion: @escaping (Result<Planet, Error>) -> Void)
    func loadSpecieDetails(elementUrl: String, completion: @escaping (Result<Specie, Error>) -> Void)
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
    
    func load(completion: @escaping (Result<InfoSpecies, Error>) -> Void) {
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

//MARK: -load element of category details
extension ApiRepository {
    //load film
    func loadFilmDetails(elementUrl: String, completion: @escaping (Result<Film, Error>) -> Void) {
        self.session.request(elementUrl,
                             method: .get,
                             parameters: nil).responseDecodable(of: Film.self) { response in
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
            
            guard let film = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(film))
        }
    }
    
    //load character
    func loadCharacterDetails(elementUrl: String, completion: @escaping (Result<Character, Error>) -> Void) {
        self.session.request(elementUrl,
                             method: .get,
                             parameters: nil).responseDecodable(of: Character.self) { response in
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
            
            guard let character = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(character))
        }
    }
    
    //load starship
    func loadStarshipDetails(elementUrl: String, completion: @escaping (Result<Starship, Error>) -> Void) {
        self.session.request(elementUrl,
                             method: .get,
                             parameters: nil).responseDecodable(of: Starship.self) { response in
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
            
            guard let starship = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(starship))
        }
    }
    
    //load vehicle
    func loadVehicleDetails(elementUrl: String, completion: @escaping (Result<Vehicle, Error>) -> Void) {
        self.session.request(elementUrl,
                             method: .get,
                             parameters: nil).responseDecodable(of: Vehicle.self) { response in
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
            
            guard let vehicle = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(vehicle))
        }
    }
    
    //load planet
    func loadPlanetDetails(elementUrl: String, completion: @escaping (Result<Planet, Error>) -> Void) {
        self.session.request(elementUrl,
                             method: .get,
                             parameters: nil).responseDecodable(of: Planet.self) { response in
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
            
            guard let planet = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(planet))
        }
    }
    
    //load specie
    func loadSpecieDetails(elementUrl: String, completion: @escaping (Result<Specie, Error>) -> Void) {
        self.session.request(elementUrl,
                             method: .get,
                             parameters: nil).responseDecodable(of: Specie.self) { response in
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
            
            guard let specie = response.value else {
                completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                
                return
            }
            
            completion(.success(specie))
        }
    }
}
