//
//  ModelView.swift
//  Star_Wars
//
//  Created by Елена on 01.02.2023.
//

import Foundation
import Alamofire

class ModelView {
    let baseURl = "https://swapi.dev/api/"
    
    @Published var listFilms: [Film] = []
    
    func fetch(title: String) {
        let url = self.baseURl + title.lowercased()
        
        AF.request(url,
                   method: .get,
                   parameters: nil).responseData { [self] response in
            if let request = response.request {
                print("Request: \(request)")
            }
            
            if let statusCode = response.response?.statusCode {
                print("Status code: \(statusCode)")
            }
            
            switch response.result {
            case .success(let data):
                do {
                    guard let decodeData = try? JSONDecoder().decode(InfoFilms.self, from: data) else { return }
                    listFilms = decodeData.results
                    print(listFilms)
                    
                } catch (let error) {
                    print(error.localizedDescription)
                    return
                }
            case .failure (let error):
                print(error.localizedDescription)
                return
            }
        }
        .resume()
    }
}
