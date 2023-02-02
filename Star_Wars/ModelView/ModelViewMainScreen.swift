//
//  ModelView.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import Foundation
import Alamofire

class ModelViewMainScreen {
    let baseURl = "https://swapi.dev/api/"
    
    @Published var arrayElementsBlock: Array<Film> = []
    
    func fetch(title: TitleScreen) {
        switch title {
        case .characters:
            fetchCharacters()
        case .films:
            fetchFilms()
        default:
            print("Error")
        }
    }
    
    func fetchFilms() {
        let url = self.baseURl + "films"
        
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
    
    func fetchCharacters() {
        let url = self.baseURl + "people"
        
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
                        //arrayElementsBlock = decodeData.results
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
