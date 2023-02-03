//
//  CardInfoScreenInteractor.swift
//  Star_Wars
//
//  Created by Елена on 03.02.2023.
//

protocol ICardInfoScreenInteractor {
    func getFilms(completion: @escaping (Result<InfoFilms, Error>) -> Void)
    func getCharacters(completion: @escaping (Result<InfoCharacters, Error>) -> Void)
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
}
