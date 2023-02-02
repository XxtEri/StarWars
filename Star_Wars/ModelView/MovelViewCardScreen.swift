//
//  MovelViewCardScreen.swift
//  Star_Wars
//
//  Created by Елена on 02.02.2023.
//

import Foundation
import Alamofire

class ModelViewCardScreen {
    let baseURl = "https://swapi.dev/api/"
    
    @Published var arrayElementsBlock: Array<Any> = []
    
    func fetch(title: TitleScreen, id: Int) {
        switch title {
        case .characters:
            fetchCharacters(id)
        case .films:
            fetchFilms(id)
        default:
            print("Error")
        }
    }
    
    func fetchFilms(_ id: Int) {
        let url = self.baseURl + "films/\(id)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil).responseData { [self] response in
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
            
            switch response.result {
            case .success(let data):
                do {
                    DispatchQueue.main.async { [self] in
                        guard let decodeData = try? JSONDecoder().decode(InfoFilms.self, from: data) else { return }
                        arrayElementsBlock = decodeData.results
                        print(arrayElementsBlock)
                    }
                    
                } catch (let error) {
                    print(error.localizedDescription)
                    return
                }
            case .failure (let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func fetchCharacters(_ id: Int) {
        let url = self.baseURl + "people/\(id)"
        
        AF.request(url,
                   method: .get,
                   parameters: nil).responseData { [self] response in
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
            
            switch response.result {
            case .success(let data):
                do {
                    DispatchQueue.main.async { [self] in
                        guard let decodeData = try? JSONDecoder().decode(InfoCharacters.self, from: data) else { return }
                        arrayElementsBlock = decodeData.results
                        print(arrayElementsBlock)
                    }
                    
                } catch (let error) {
                    print(error.localizedDescription)
                    return
                }
            case .failure (let error):
                print(error.localizedDescription)
                return
            }
        }
    }
}
