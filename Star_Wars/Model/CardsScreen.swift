//
//  CardScreen.swift
//  Star_Wars
//
//  Created by Елена on 02.02.2023.
//

import Foundation

struct CardsScreen {
    let title: String
}

extension CardsScreen {
    init(model: InfoFilms) {
        self.title = TitleScreen.films.rawValue
    }
    
    init(model: InfoCharacters) {
        self.title = TitleScreen.characters.rawValue
    }
    
    init(model: InfoPlanets) {
        self.title = TitleScreen.planets.rawValue
    }
    
    init(model: InfoSpecies) {
        self.title = TitleScreen.species.rawValue
    }
    
    init(model: InfoVehicles) {
        self.title = TitleScreen.vehicles.rawValue
    }
    
    init(model: InfoStarships) {
        self.title = TitleScreen.starships.rawValue
    }
}
